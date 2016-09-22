class MatchesController < ApplicationController
  before_action :find_team
  before_action :find_match, only: [:show]

  def index
    @match = Match.where(ladder_id: @team.ladder_id).where("match_time > ?",
      Time.zone.now)
  end
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
    #if @match.am_pm == 'PM' unless @match.hours == 12
     # @match.hours = @match.hours.to_i + 12
    #elsif @match.am_pm == 'AM' && @match.hours == 12
    #  @match.hours == 24

    #end
    @match.match_time = Time.parse(@match.hours.to_s + ":" + @match.minutes)
    if @match.save
     redirect_to team_matches_path(@team.id)
    else
      redirect_to root_path
    end
  end
  def show
  end
  private
    def match_params
      params.require(:match).permit(:hours, :minutes, :am_pm, :best_of)
    end
    def find_team
      @team = Team.find(params[:team_id])
    end
    def find_match
      @match = Match.find(params[:id])
    end
end
