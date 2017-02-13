class LaddersController < ApplicationController
  before_action :find_platform
  before_action :find_game
  before_action :find_ladder, only: [:destroy]

  def new
    @ladder = Ladder.new
  end

  def create
    @ladder = Ladder.new(ladder_params)
    @ladder.game_id = @game.id

    if @ladder.save
      redirect_to platform_game_path(@platform.id, @game.id)
    else
      #fail message
    end
  end

  def destroy
    @ladder.destroy
    redirect_to platform_game_path(@platform.id,@game.id)
  end


  private
    def ladder_params
      params.require(:ladder).permit(:game_id, :name, :match_player_count)
    end
    def find_platform
      @platform = Platform.find(params[:platform_id])
    end
    def find_game
      @game = Game.find(params[:game_id])
    end
    def find_ladder
      @ladder = Ladder.find(params[:id])
    end
  end
