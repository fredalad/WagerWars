class UsersController < ApplicationController
  before_action :find_team

  def index
    @users = User.search(params[:search])
  end

  private
    def find_team
      @team = Team.find(params[:team_id])
    end
end
