require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  
  
  def setup
    @ticket_hash = api_ticket_hash['ticket']
    @tickets_hash = api_tickets_hash['tickets']
    @ticket = Ticket.new(@ticket_hash)
  end
  
  
  
  
  
  

  test "valid id" do
    assert_equal @ticket.id, @ticket_hash['id']
  end
  
  test "valid subject" do
    assert_equal @ticket.subject, @ticket_hash['subject']
  end
  
  test "valid description" do
    assert_equal @ticket.description, @ticket_hash['description']
  end

  test "valid date" do
    date = DateTime.parse(@ticket_hash['created_at']).to_date
    assert_equal @ticket.created_at, date
  end
  
  test "valid requester_id" do
    assert_equal @ticket.requester_id, @ticket_hash['requester_id']
  end
  
  test "valid status" do
    assert_equal @ticket.status, @ticket_hash['status']
  end
  
  
  
  
  test "Tickets array is of correct size" do
    tickets = Ticket.array(@tickets_hash)
    assert_equal tickets.size, @tickets_hash.size
  end  
  
  test "Tickets array instantiates tickets id" do
    tickets = Ticket.array(@tickets_hash)
    tickets.each_with_index do |ticket, i|
      id = i + 1
      assert_equal ticket.id, id
    end
  end  
  
  test "Tickets array handles empty array" do
    tickets = Ticket.array([])
    assert_equal tickets.size, 0
  end
  
end
