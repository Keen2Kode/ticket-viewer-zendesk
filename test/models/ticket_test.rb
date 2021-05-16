require 'test_helper'
# require 'app/models/ticket'
class TicketTest < ActiveSupport::TestCase
  
  
  def setup
    # due to time constraints, I chose to mock the json data manually
    # no access to fixtures since active record skipped
    @json_data = 
      {
        'id' => 1,
        'subject' => "Subject name",
        'description' => "Hello this is a description",
        'created_at' => "2012-04-04T09:14:57Z",
        'requester_id' => "",
        'status' => "open"
      }
    
    @data_array = 
      [
        {
          'id' => 1,
          'subject' => "Subject name",
          'description' => "Hello this is a description",
          'created_at' => "2012-04-04T09:14:57Z",
          'requester_id' => 1234,
          'status' => "open"
        },
        {
          'id' => 2,
          'subject' => "Subject name",
          'description' => "Hello this is a description",
          'created_at' => "2012-04-04T09:14:57Z",
          'requester_id' => 1234,
          'status' => "open"
        }
      ]
      
    
    @ticket = Ticket.new(@json_data)
  #   assert true
  end
  
  
  
  
  
  

  test "valid id" do
    assert_equal @ticket.id, @json_data['id']
  end
  
  test "valid subject" do
    assert_equal @ticket.subject, @json_data['subject']
  end
  
  test "valid description" do
    assert_equal @ticket.description, @json_data['description']
  end

  test "valid date" do
    date = DateTime.parse(@json_data['created_at']).to_date
    assert_equal @ticket.created_at, date
  end
  
  test "valid requester_id" do
    assert_equal @ticket.requester_id, @json_data['requester_id']
  end
  
  test "valid status" do
    assert_equal @ticket.status, @json_data['status']
  end
  
  
  
  
  test "Tickets array is of correct size" do
    tickets = Ticket.array(@data_array)
    assert_equal tickets.size, @data_array.size
  end  
  
  test "Tickets array instantiates tickets id" do
    tickets = Ticket.array(@data_array)
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
