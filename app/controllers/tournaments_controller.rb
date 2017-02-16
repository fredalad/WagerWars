class TournamentsController < ApplicationController
  before_action :find_tournament, only: [:show, :edit, :update]
  before_action :find_matches, only: [:show, :edit, :update]

  def index
    @tournament = Tournament.all
  end

  def new
    @tournament = Tournament.new
    @game = Game.all
  end

  def create
    @tournament = Tournament.new(tournament_params)
    depth = find_power_of_two(@tournament.team_count, 0)
    @tournament.hours = @tournament.hours.to_i
    if (@tournament.am_pm == 'PM' && @tournament.hours != 12) || (@tournament.am_pm == 'AM' && @tournament.hours == 12)
      @tournament.hours += 12
    end
    date = parse_date(@tournament.date)
    the_offset = Time.now.in_time_zone(current_user.time_zone).utc_offset
    @tournament.start_time = Time.new(Time.zone.now.year.to_i,
                         Time.zone.now.month.to_i,
                         date,
                         @tournament.hours,
                         @tournament.minutes.to_i, 0, the_offset)
    if @tournament.save
      generate_match(depth, 0, @tournament.start_time)
      redirect_to root_path
    end
  end

  def show
    @match = @match.order(next_match_id: :desc)
  end

  def edit
    #If team count is 0 or they dont have any valid teams make button for them
    # to create one
    @team = Array.new
    current_user.team_id.each do |value|
      @team << Team.find(value)
    end
  end

  def update
    ####### this should change #######
    @tournament = Tournament.new(tournament_params)
    @team = Team.find(@tournament.team_id)
    ####################################33
    @match = @match.order(next_match_id: :desc)
    total_match_count = (@match.count / 2) + 1
    count = 0
    @match.each do |match|
      if count == total_match_count
        break
      end
      if match.chlg_team_name == nil
        match.chlg_team_id = @team.id
        match.chlg_team_name = @team.name
        match.save!
        break
      elsif match.acpt_team_name == nil
        match.acpt_team_id = @team.id
        match.acpt_team_name = @team.name
        match.accepted = true
        match.save!
        break
      end
      count += 1
    end
    redirect_to root_path
  end
  private
    def tournament_params
      params.require(:tournament).permit(:name,:game_id, :team_count,
       :cash_prize, :team_id, :hours, :minutes, :am_pm, :date)
    end
    def find_tournament
      @tournament = Tournament.find(params[:id])
    end
    def find_matches
      @match = Match.where(tournament_id: @tournament.id)
    end
    def find_team
          @team = Team.find(@tournament.team_id)
    end
    def parse_date(str)
      split_date = str.split('/')
      return split_date[1]
    end

    def generate_match(depth, match_id, time)
      if depth == 0
        @match = Match.find(match_id)
        @match.match_time = time
        @match.save
        return nil
      end
      current_node = Node.new(depth)
      if match_id == 0
        @match = Match.new
        @match.next_match_id = -1
        @match.tournament_id = @tournament.id
        @match.tournament_match = true
        @match.ladder_match = false
        @match.game_id = @tournament.game_id
        #change this##################3
        @match.best_of = 3
        ####################3

        if @match.save
          id = @match.id
          current_node.left = generate_match(depth - 1, id, time)
          current_node.right = generate_match(depth - 1, id, time)
        end

      elsif depth > 0
        @match = Match.new
        @match.next_match_id = match_id
        @match.tournament_id = @tournament.id
        @match.tournament_match = true
        @match.ladder_match = false
        @match.game_id = @tournament.game_id
        #change this##################3
        @match.best_of = 3
        ####################3
        if @match.save
          id = @match.id
          current_node.left = generate_match(depth - 1, id, time)
          current_node.right = generate_match(depth - 1, id, time)
        end
      end
    end
end

class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
  end
end
