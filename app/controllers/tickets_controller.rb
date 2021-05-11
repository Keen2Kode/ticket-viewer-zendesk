class TicketsController < ApplicationController
  
  def index
    @tickets = @json_data.map {|data| Ticket.new(data) }
  end

  def show
    @ticket = Ticket.new(@json_data)
  end
  
end
