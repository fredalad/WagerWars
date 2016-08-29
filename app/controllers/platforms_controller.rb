class PlatformsController < ApplicationController

    def index
      @platform = Platform.all
    end
end
