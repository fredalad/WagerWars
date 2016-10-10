class MatchesController < ApplicationController
  before_action :find_team
  before_action :find_match, only: [:show, :edit, :destroy, :update]
  before_action :find_ladder, only: [:create]

  def index
    if params[:match_status] == "upcoming"
      @match = Match.where(ladder_id: @team.ladder_id).where(chlg_team_id: @team.id).where("match_time > ?",
      Time.zone.now)
    else
      @match = Match.where(ladder_id: @team.ladder_id).where(accepted: false).where("match_time > ?",
      Time.zone.now)
    end
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.ladder_id = @team.ladder_id
    @match.chlg_team_name = @team.name
    @match.chlg_team_id = @team.id
    @match.accepted = false
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
    if @team.roster_count < @ladder.match_player_count
      redirect_to new_team_match_path(@team.id, :error => "roster_size")
     elsif @match.save
      redirect_to team_matches_path(@team.id)
     else
      redirect_to root_path
     end

  end
  def show
  end
  def edit
    #render 'show'
  end
  def update
    if params[:match] == "accepted"
      @match.acpt_team_id = @team.id
      @match.acpt_team_name = @team.name
      @match.accepted = true
      @match.save
      render 'show'
    elsif params[:match_status] == "report"
      ticket = false
      if @match.save && @match.update(match_params)
        if @match.chlg_team_reported && @match.acpt_team_reported
          if @match.acpt_team_wins == @match.chlg_team_wins
            ticket = true
            redirect_to root_path
          elsif @match.acpt_team_wins >= @match.chlg_team_losses
            #accapting team wins
            find_winning_team(@match.acpt_team_id)
            find_losing_team(@match.chlg_team_id)
            @winning_team.wins += 1
            @losing_team.losses += 1
          elsif @match.chlg_team_wins >= @match.acpt_team_losses
            #challange team wins
            find_winning_team(@match.chlg_team_id)
            find_losing_team(@match.acpt_team_id)
            @winning_team.wins += 1
            @losing_team.losses += 1

          end
          if !ticket
            @match.completed = true
            if @winning_team.save && @losing_team.save && @match.save
              redirect_to team_matches_path(@team.id)
            end
          end
        else
          redirect_to team_path(@team.id)
        end
      else
        render 'edit'
      end

    end

  end

  def destroy
    @match.destroy
    redirect_to team_matches_path(@team.id)
  end

  private
    def match_params
      params.require(:match).permit(:hours, :minutes, :am_pm, :best_of, :acpt_team_wins, :acpt_team_losses, :acpt_team_reported,
        :chlg_team_reported, :chlg_team_wins, :chlg_team_losses)
    end
    def find_team
      @team = Team.find(params[:team_id])
    end
    def find_winning_team(team_id)
      @winning_team = Team.find(team_id)
    end
    def find_losing_team(team_id)
      @losing_team = Team.find(team_id)
    end
    def find_match
      @match = Match.find(params[:id])
    end
    def find_ladder
      @ladder = Ladder.find(@team.ladder_id)
    end
end
