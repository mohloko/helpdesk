class TicketsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index]
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    
  end
  
  def edit 
    @ticket = Ticket.find(params[:id])
  end
  
  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      flash[:success] = "Ticket atualizado!"
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def new
    @ticket = Ticket.new
    @user = current_user
  end
  
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
  end

  def update
  end
  
  private
  
  def ticket_params
    params.require(:ticket).permit(:subject, :body, :status)
  end
  
end
