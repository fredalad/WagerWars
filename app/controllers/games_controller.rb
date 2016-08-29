class GamesController < ApplicationController
  before_action :find_platform
  before_action :find_game, only: [:destroy]

  def new
    @game = Game.new
  end

  def show

  end

  def create
    @game = Game.new(game_params)
    @game.platform_id = @platform.id

    if @game.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @game.destroy
    redirect_to root_path
  end

  private
   def game_params
    params.require(:game).permit(:platform_id, :name, :game_img)
   end

   def find_platform
    @platform = Platform.find(params[:platform_id])
   end
   def find_game
    @game = Game.find(params[:id])
   end
end
