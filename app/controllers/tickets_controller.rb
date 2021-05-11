class TicketsController < ApplicationController
  
  def index
    # using ApplicationHelper to handle request handling -> json
    path = tickets_path
    data_array = json_data(path)
    @tickets = data_array.map {|data| Ticket.new(data) }
  end

  def show
    path = ticket_path(params[:id])
    data = json_data(path)
    @ticket = Ticket.new(data)
  end
  
end
