class TicketsController < ApplicationController
  before_action :find_team, only: [:new, :create]
  before_action :find_match, only: [:new, :create]
  before_action :find_ticket, only: [:show, :edit, :update]

  def index
    @ticket = Ticket.where(completed: false)
  end
  def new
    @ticket = Ticket.new
  end
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.match_id = @match.id
    @match.ticket_id = @ticket.id
    @ticket.chlg_team_name = @match.chlg_team_name
    @ticket.chlg_team_id = @match.chlg_team_id
    @ticket.acpt_team_name = @match.acpt_team_name
    @ticket.acpt_team_id = @match.acpt_team_id
    if @match.chlg_team_id == @team.id
      @match.chlg_team_dispute_reported = true
    else
      @match.acpt_team_dispute_reported = true
    end
    if @ticket.save && @match.save
      @match.ticket_id = @ticket.id
      if @match.save
        redirect_to root_path
      end
    end
  end
  def show
  end
  def edit
    if user_signed_in? && is_admin?(current_user.email)

    else
       @team = Team.find(params[:team_id])
       @match = Match.find(params[:match_id])
    end
  end
  def update
    if user_signed_in? && is_admin?(current_user.email)
      @match = Match.find(@ticket.match_id)
      if params[:winner] == "chlg_team"
        find_winning_team(@ticket.chlg_team_id)
        find_losing_team(@ticket.acpt_team_id)
        @winning_team.wins += 1
        @losing_team.losses += 1
      else
        find_winning_team(@ticket.acpt_team_id)
        find_losing_team(@ticket.chlg_team_id)
        @winning_team.wins += 1
        @losing_team.losses += 1
      end
      @ticket.completed = true
      @match.completed = true
      if @ticket.save && @match.save && @winning_team.save && @losing_team.save
        redirect_to tickets_path
      else
        redirect_to root_path
      end
    else
      @team = Team.find(params[:team_id])
      @ticket.update(ticket_params)
      redirect_to root_path
    end

  end
  private
    def ticket_params
      params.require(:ticket).permit(:acpt_team_img1, :acpt_team_img2,
        :acpt_team_img3, :acpt_team_img4, :acpt_team_img5, :chlg_team_img1,
        :chlg_team_img2, :chlg_team_img3, :chlg_team_img4, :chlg_team_img5)
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
    def find_winning_team(team_id)
      @winning_team = Team.find(team_id)
    end
    def find_losing_team(team_id)
      @losing_team = Team.find(team_id)
    end
end
