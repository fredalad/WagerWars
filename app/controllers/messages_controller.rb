class MessagesController < ApplicationController
  def index

  end
  def new
    if params[:test] == "true"
      @test = "hi"
    else
      @test ="bye"
    end
  end
end
