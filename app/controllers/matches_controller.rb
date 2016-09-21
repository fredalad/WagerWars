class MatchesController < ApplicationController
  before_action :find_team, only: [:new, :create]

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.ladder_id = @team.ladder_id
    @match.chlg_team_name = @team.name
    @match.chlg_team_id = @team.id
    @match.challange = false
    @match.completed = false
    @match.disputed = false
    @match.acpt_team_wins = @match.hours.to_i
    @match.match_time = Time.zone.local(Time.zone.now.year, Time.zone.now.month,
      Time.zone.now.day, @match.hours.to_i, @match.minutes.to_i)
    if @match.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private
    def match_params
      params.require(:match).permit(:hours, :minutes, :am_pm, :best_of)
    end
    def find_team
      @team = Team.find(params[:team_id])
    end
end
