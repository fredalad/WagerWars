class MessagesController < ApplicationController
  before_action :find_user
  before_action :find_team, only: [:new]
  before_action :find_message, only: [:show]

  def index
    @message = Message.where(desination_user_id: current_user.id)
  end
  def new
    @message = Message.new
    flash[:team_id] = @team.id
    flash.keep(:team_id)
  end

  def create
    @message = Message.new
    @message.team_id = flash[:team_id]
    @message.user_id = current_user.id
    @message.source_user_id = current_user.id
    @message.source_username = current_user.username
    @message.desination_user_id = @user.id
    @message.desination_username = @user.username
    @message.subject = "Team Invite"
    @message.body = "[insert team name] wants you to join their team"
    if @message.save
      redirect_to root_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:source_user_id, :desination_user_id,
       :source_username, :desination_username, :subject, :body)
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
end
