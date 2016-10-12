class SettingsController < ApplicationController
  before_action :find_platform
  before_action :find_game
  before_action :find_ladder

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    @setting.ladder_id = @ladder.id
    if @setting.save
      redirect_to platform_game_path(@platform.id, @game.id)
    end
  end

  private
    def setting_params
      params.require(:setting).permit(:mlg_rules, :map_name, :game_type)
    end
    def find_platform
      @platform = Platform.find(params[:platform_id])
    end
    def find_game
      @game = Game.find(params[:game_id])
    end
    def find_ladder
      @ladder = Ladder.find(params[:ladder_id])
    end
end
