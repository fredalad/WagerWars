class MessagesController < ApplicationController
  before_action :find_user
  before_action :find_team, only: [:new], :if => :invite
  before_action :find_message, only: [:show, :destroy]

  def index
    if params[:message] == "show_read"
      @message = Message.where(desination_user_id: current_user.id)
    else
      @message = Message.where(desination_user_id: current_user.id, read: false)
    end
  end

  def new
    @message = Message.new
    if params[:message] == "invite"
      flash[:team_id] = @team.id
      flash.keep(:team_id)
    else

    end
  end

  def create

    if params[:message_invite] == "invite"
      @message = Message.new
      @team = Team.find(flash[:team_id])
      @message.team_id = @team.id
      @message.subject = "Team Invite"
      @message.body = "Team " + @team.name.to_s + " wants you to join their team"
    else
      @message = Message.new(message_params)
    end
      @message.user_id = current_user.id
      @message.source_user_id = current_user.id
      @message.source_username = current_user.username
      @message.desination_user_id = @user.id
      @message.desination_username = @user.username
      @message.read = false
    if @message.save
      redirect_to user_messages_path(current_user.id)
    end
  end

  def show
    @message.read = true
    @message.save
  end

  def destroy
    @message.destroy
    redirect_to :back
  end

  private
    def message_params
      params.require(:message).permit(:source_user_id, :desination_user_id,
       :source_username, :desination_username, :subject, :body, :message_invite)
    end

    def find_message
      @message = Message.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end

    def find_team
      @team = Team.find(params[:team_id])
    end
    def invite
      if params[:message] == "invite"
        true
      else
        false
      end
    end
end
