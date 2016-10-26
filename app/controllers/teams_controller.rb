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
    @team.game_id = @ladder.game_id
    @team.user_id << current_user.id
    @team.wins = 0
    @team.losses = 0
    @team.roster_count = 1
    @team.leader = current_user.username
    if current_user.team_count == nil
      current_user.team_count = 1
    else
      current_user.team_count += 1
    end
    if @team.save
      current_user.team_id << @team.id
      if current_user.save
        redirect_to team_path(@team.id)
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def edit
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
    @user = User.all.select {|u| u.team_id.include? @team.id }
    @user.each do |user|
      user.team_id.delete(@team.id)
      user.team_count -= 1
      user.save
    end
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
