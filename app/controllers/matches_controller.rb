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
    @match.hours = @match.hours.to_i + 12
    #elsif @match.am_pm == 'AM' && @match.hours == 12
    #  @match.hours == 24

    #end
    #Time.zone = "UTC"

      time_entered = Time.new(Time.zone.now.year.to_i,
                              Time.zone.now.month.to_i,
                              23,
                              @match.hours.to_i,
                              @match.minutes.to_i)
      Time.zone = current_user.time_zone
      @match.acpt_team_name = Time.zone
      the_offset = Time.zone.parse(time_entered.to_s).utc_offset

      @match.acpt_team_wins = the_offset

      new_time = Time.new(Time.zone.now.year.to_i,
                          Time.zone.now.month.to_i,
                          23,
                          @match.hours.to_i,
                          @match.minutes.to_i, 0, the_offset)
      @match.match_time = new_time


    @match.acpt_team_wins = Time.strptime(@match.hours.to_s + ":" + @match.minutes + ":" + current_user.time_zone ,'%H:%M:%Z').utc_offset
    @match.match_time = Time.strptime(@match.hours.to_s + ":" + @match.minutes + ":" + current_user.time_zone ,'%H:%M:%Z')
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
