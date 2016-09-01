class PlatformsController < ApplicationController
  before_action :find_platform, only: [:show, :destroy]
  def index
    @platform = Platform.all
  end

  def show
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @platform.destroy
    redirect_to root_path
  end

  private
    def platform_params
      params.require(:platform).permit(:name)
    end
    def find_platform
      @platform = Platform.find(params[:id])
    end

end
