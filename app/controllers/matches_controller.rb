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
    @match.hours = @match.hours.to_i
    if (@match.am_pm == 'PM' && @match.hours != 12) || (@match.am_pm == 'AM' && @match.hours == 12)
      @match.hours += 12
    end
    the_offset = Time.now.in_time_zone(current_user.time_zone).utc_offset
    @match.match_time = Time.new(Time.zone.now.year.to_i,
                         Time.zone.now.month.to_i,
                         Time.zone.now.day,
                         @match.hours,
                         @match.minutes.to_i, 0, the_offset)
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
