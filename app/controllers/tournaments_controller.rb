class TournamentsController < ApplicationController

  def index
  end

  def new
    @tournament = Tournament.new
    @game = Game.all
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
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
end
