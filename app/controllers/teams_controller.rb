class TeamsController < ApplicationController
  before_action :find_team, only: [:destroy, :show, :update]
  before_action :find_platform, only: [:new, :create]
  before_action :find_game, only: [:new, :create]
  before_action :find_ladder, only: [:new,:create]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.ladder_id = @ladder.id
    @team.ladder_name = @ladder.name
    @team.user_id = [current_user.id]
    if @team.save!
      redirect_to team_path(@team.id)
    else
      redirect_to root_path
    end
  end
  def update

  end

  def show
     @user = Array.new
     @team.user_id.each do |value|
      @user << User.find(value)
    end
  end

  def destroy
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
    def find_ladder
      @ladder = Ladder.find(params[:ladder_id])
    end
    def find_game
      @game = Game.find(params[:game_id])
    end
    def find_platform
      @platform = Platform.find(params[:platform_id])
    end
end
