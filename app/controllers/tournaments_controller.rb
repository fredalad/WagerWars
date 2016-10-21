class TournamentsController < ApplicationController

  def index
  end

  def new
    @tournament = Tournament.new
    @game = Game.all
  end

  def create
    @tournament = Tournament.new(tournament_params)
    x = find_power_of_two(@tournament.team_count, 0)
    @tournament.game_name = x.to_s
    if @tournament.save
      #@match = Match.new
      #@match.next_match_id = -1
      #@match.tournament_id = @tournament.id
      #@match.tournament_match = true
      #@match.ladder_match = false
      #@match.game_id = @tournament.game_id
      #id = @match.id
      count = 1
      #if @match.save
        generate_match(x, 0)
      #end

      redirect_to root_path
    end

  end

  def show
  end

  def edit
  end

  def update
  end
  private
    def tournament_params
      params.require(:tournament).permit(:name,:game_id, :team_count,
       :cash_prize)
    end
    def generate_match(depth, match_id)
      if depth < 0
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

        if @match.save
          id = @match.id
          current_node.left = generate_match(depth -1, id)
          current_node.right = generate_match(depth -1, id)
        end
      elsif depth > 0

      @match = Match.new
      @match.next_match_id = match_id
      @match.tournament_id = @tournament.id
      @match.tournament_match = true
      @match.ladder_match = false
      @match.game_id = @tournament.game_id

      if @match.save
        id = @match.id
        current_node.left = generate_match(depth -1, id)
        current_node.right = generate_match(depth -1, id)
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
