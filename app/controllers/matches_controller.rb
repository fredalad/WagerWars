class MatchesController < ApplicationController
  before_action :find_team
  before_action :find_match, only: [:show, :edit, :destroy, :update]
  before_action :find_ladder, only: [:create, :new]

  def index
    if params[:match_status] == "upcoming"
      @match = Match.where(ladder_id: @team.ladder_id).where(chlg_team_id: @team.id).where(accepted: true).where(completed: false)
      if @match.size == 0
        @match = Match.where(ladder_id: @team.ladder_id).where(acpt_team_id: @team.id).where(accepted: true).where(completed: false)
      end
    elsif params[:match_status] == "disputed"
      @match = Match.where(ladder_id: @team.ladder_id).where(chlg_team_id: @team.id).where(disputed: true)
      if @match.size == 0
        @match = Match.where(ladder_id: @team.ladder_id).where(acpt_team_id: @team.id).where(disputed: true)
      end
    elsif params[:match_type] == "tournament"
      @match = Match.where(chlg_team_id: @team.id).where(tournament_match: true).where("match_time > ?", Time.zone.now)
      if @match.size == 0
        @match = Match.where(acpt_team_id: @team.id).where(tournament_match: true).where("match_time > ?", Time.zone.now)
      end
    elsif params[:match_status] == "completed"
        @match = Match.where(chlg_team_id: @team.id).or(Match.where(acpt_team_id: @team.id)).where(completed: true)
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
    if @match.chlg_player_names.size != @match.match_player_count
      redirect_to new_team_match_path(@team.id, :error => "player_count")
    else
      @match.ladder_id = @team.ladder_id
      @match.game_id = @ladder.game_id
      @match.chlg_team_name = @team.name
      @match.chlg_team_id = @team.id
      @match.acpt_team_dispute_reported = false
      @match.chlg_team_dispute_reported = false
      @match.ladder_match = true
      @match.tournament_match = false
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
                           @match.minutes.to_i, 0, the_offset).to_s

      ##################comented for testing ###################3
      #if @team.roster_count < @ladder.match_player_count
      #  redirect_to new_team_match_path(@team.id, :error => "roster_size")
      #################################################################

       if @match.save! # should be else if when above is uncommented
        redirect_to team_matches_path(@team.id)
       else
        redirect_to root_path
       end
    end
  end

  def show
    @setting = Array.new
    @match.setting_id.each do |value|
      @setting << Setting.find(value)
    end
  end

  def edit
    #render 'show'
  end
  def update
    if params[:match] == "accepted"
      @match.acpt_team_id = @team.id
      @match.acpt_team_name = @team.name
      @match.accepted = true
      count = 0
      @setting = Setting.where(ladder_id: @match.ladder_id).where(mlg_rules: @match.mlg_rules).order("RAND()")
      @setting.each do |setting|
        if count == @match.best_of
          break
        end
        @match.setting_id << setting.id
        count += 1
      end
      if @match.save
        redirect_to team_match_path(@team.id, @match.id)
      end
    elsif params[:match_status] == "report"
      ticket = false
      if @match.save && @match.update(match_params)
        if @match.chlg_team_reported && @match.acpt_team_reported
          if @match.acpt_team_wins == @match.chlg_team_wins
            ticket = true
          elsif @match.acpt_team_wins > @match.chlg_team_wins
            #accapting team wins
            find_winning_team(@match.acpt_team_id)
            find_losing_team(@match.chlg_team_id)
            if @match.tournament_match == true
              if @match.next_match_id == -1
                #award prize
              end
              @next_match = Match.find(@match.next_match_id)

              if @next_match.chlg_team_id == nil
                @next_match.chlg_team_id = @winning_team.id
                @next_match.chlg_team_name = @winning_team.name

              elsif @next_match.acpt_team_id == nil
                @next_match.acpt_team_id = @winning_team.id
                @next_match.acpt_team_name = @winning_team.name

              end
            else
              @winning_team.wins += 1
              @losing_team.losses += 1
            end
          elsif @match.chlg_team_wins > @match.acpt_team_wins
            #challange team wins
            find_winning_team(@match.chlg_team_id)
            find_losing_team(@match.acpt_team_id)

            if @match.tournament_match == true
              if @match.next_match_id == -1
                #award prize
              end
              @next_match = Match.find(@match.next_match_id)

              if @next_match.chlg_team_id == nil
                @next_match.chlg_team_id = @winning_team.id
                @next_match.chlg_team_name = @winning_team.name

              elsif @next_match.acpt_team_id == nil
                @next_match.acpt_team_id = @winning_team.id
                @next_match.acpt_team_name = @winning_team.name

              end
            else
              @winning_team.wins += 1
              @losing_team.losses += 1
            end
          end
          if !ticket
            @match.completed = true

            if @match.tournament_match && @match.save && @next_match.save
              redirect_to team_matches_path(@team.id)

            elsif @winning_team.save && @losing_team.save && @match.save
              redirect_to team_matches_path(@team.id)
            end
          else
            @match.disputed = true
            if @match.save
              redirect_to team_path(@team.id)
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
      params.require(:match).permit(:hours, :minutes, :am_pm, :best_of, :mlg_rules, :acpt_team_wins, :acpt_team_losses, :acpt_team_reported,
        :chlg_team_reported, :chlg_team_wins, :chlg_team_losses, :match_player_count, chlg_player_names: [])
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
    def find_next_match(match_id)
      @next_match = Match.find(3784)
    end
    def find_setting
      @setting = Setting.where(ladder_id: @match.ladder_id).where(mlg_rules: @match.mlg_rules)
    end
    def find_match
      @match = Match.find(params[:id])
    end
    def find_ladder
      @ladder = Ladder.find(@team.ladder_id)
    end
end
