require 'test_helper'


class TicketsControllerTest < ActionDispatch::IntegrationTest
  
  
  
  def setup
    
    @json_data = 
    {
      'ticket' => 
      {
        'id' => 1,
        'subject' => "Subject name",
        'description' => "Hello this is a description",
        'created_at' => "2012-04-04T09:14:57Z",
        'requester_id' => 1234,
        'status' => "open"
      }
    }
    
    @data_array = 
    {
      'tickets' => 
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
    }
    
    @tickets = Ticket.array(@data_array['tickets'])
    @ticket = Ticket.new(@json_data['ticket'])
  end
  
  def mock_json_data(data)
    Zendesk.stub :json_data, data do
      yield
    end
  end
  
  
  test "should get index" do
    
    mock_json_data @data_array do
      get tickets_url
      assert_response :success
    end
  end

  test "should show ticket" do
    mock_json_data @json_data do
      get ticket_url @ticket.id
      assert_response :success
    end
  end


  test "should show page" do
    mock_json_data @data_array do
      get tickets_url page = 10
      assert_equal 10, @controller.params[:format].to_i
    end
  end

  test "should show existing ticket" do
    mock_json_data @json_data do 
      get ticket_url @ticket.id
      assert_response :success
    end
  end
  
  
end
