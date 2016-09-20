class MatchesController < ApplicationController
  before_action :find_team, only: [:new, :create]

  def new
    @match = Match.new
  end
  def create
    @match = Match.new
    @match.ladder_id = @team.ladder_id
    if @match.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private
    def find_team
      @team = Team.find(params[:team_id])
    end
end
