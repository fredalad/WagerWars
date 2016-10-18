class UsersController < ApplicationController
  before_action :find_team, :if => :new_message
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    if params[:message_stage] != "find_user"
      @roster = Array.new

      @team.user_id.each do |value|
        @roster << User.find(value)
      end
    end
    if params[:search]
      @users = User.search(params[:search])
      @search_flag = true
    end
  end

  def edit
  end

  def update
    @team.user_id << @user.id
    @team.roster_count += 1
    @user.team_id << @team.id
    if @user.team_count == nil
      @user.team_count = 1
    else
      @user.team_count += 1
    end
    if @team.save && @user.save
      redirect_to root_path
    else
      render 'edit'
    end
  end
  def destroy
    @user.team_id.delete(@team.id)
    @team.user_id.delete(@user.id)
    if @team.save && @user.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def find_team
      @team = Team.find(params[:team_id])
    end
    def find_user
      @user = User.find(params[:id])
    end
    def new_message
      if params[:message_stage] != "find_user"
        true
      else
        false
      end
    end
end
