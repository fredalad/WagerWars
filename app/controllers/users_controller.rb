class UsersController < ApplicationController
  before_action :find_team

  def index
    if params[:search]
      @users = User.search(params[:search])
      @search_flag = true
    end
  end

  private
    def find_team
      @team = Team.find(params[:team_id])
    end
end
