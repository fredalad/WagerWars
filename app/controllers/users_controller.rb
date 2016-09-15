class UsersController < ApplicationController
  before_action :find_team
  before_action :find_user, only: [:edit, :update]

  def index
    if params[:search]
      @users = User.search(params[:search])
      @search_flag = true
    end
  end

  def edit
  end

  def update
    @team.user_id << @user.id
    @user.team_id << @team.user_id
    if @team.save! && @user.save!
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
end
