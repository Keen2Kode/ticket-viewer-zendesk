class TicketsController < ApplicationController
  TICKETS_PER_PAGE = 25
  
  def index
    @page = params.fetch(:page, 1).to_i
    data = json_data(page: @page, per_page: TICKETS_PER_PAGE)
    @tickets = Ticket.array(data['tickets'])
    
    @has_next_page = data['next_page']
    @has_prev_page = data['previous_page']
  end

  def show
    @ticket = Ticket.new(json_data['ticket'])
  end
  
end
