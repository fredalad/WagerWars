class TeamsController < ApplicationController
  before_action :find_team, only: [:destroy, :show]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @user = User.where(:id => current_user.id)
    @team.users << @user
    if @team.save
      redirect_to team_path(@team.id)
    else
      redirect_to new_user_registration_path
    end
  end

  def show
  end

  def destroy
    @team.users.destroy_all
    @team.destroy
    redirect_to root_path
  end

  private
    def team_params
      params.require(:team).permit(:name, :user_ids => [])
    end

    def find_team
      @team = Team.find(params[:id])
    end
end
