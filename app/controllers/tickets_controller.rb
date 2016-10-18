class TicketsController < ApplicationController
  before_action :find_team, only: [:create]
  before_action :find_match, only: [:create]
  before_action :find_ticket, only: [:show, :edit, :update]

  def index
    @ticket = Ticket.all
  end
  def new
    @ticket = Ticket.new
  end
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.match_id = @match.id
    if @match.chlg_team_id == @team.id
      @match.chlg_team_dispute_reported = true
    else
      @match.acpt_team_dispute_reported = true
    end

    if @ticket.save && @match.save
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
    def ticket_params
      params.require(:ticket).permit(:proof_img1, :proof_img2, :proof_img3, :proof_img4, :proof_img5)
    end
    def find_ticket
      @ticket = Ticket.find(params[:id])
    end
    def find_team
      @team = Team.find(params[:team_id])
    end
    def find_match
      @match = Match.find(params[:match_id])
    end
end
