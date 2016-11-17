class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]

  def index
    if current_user.admin?
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets
    end
  end

  def new
    @ticket = Ticket.new
    @train_id = params[:train_id]
    @begin_station_id = params[:begin_station_id]
    @end_station_id = params[:end_station_id]
  end

  def show
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :surname, :passport, :train_id, 
                                   :begin_station_id, :end_station_id)
  end
end
