require 'test_helper'


class TicketsControllerTest < ActionDispatch::IntegrationTest
  
  
  
  def setup
    @tickets = Ticket.array(api_tickets_hash['tickets'])
    @ticket = Ticket.new(api_ticket_hash['ticket'])
  end
  
  def mock_zendesk_hash(data)
    Zendesk.stub :json_data, data do
      yield
    end
  end
  
  
  test "should get index" do
    mock_zendesk_hash api_tickets_hash do
      get tickets_url
      assert_response :success
    end
  end

  test "should get show" do
    mock_zendesk_hash api_ticket_hash do
      get ticket_url @ticket.id
      assert_response :success
    end
  end
  
  test "should get index for 0 tickets" do
    mock_zendesk_hash api_tickets_hash(amount = 0) do 
      get tickets_url
      assert_response :success
    end
  end
  
  test "should get page" do
    mock_zendesk_hash api_tickets_hash do
      get tickets_url page = 10
      page_param = @controller.params[:format].to_i
      assert_equal 10, page_param
      assert_response :success
    end
  end
  
  
  
  
  
  
  
  
  test "should display correct amount of tickets" do
    mock_zendesk_hash api_tickets_hash(amount = 20) do 
      get tickets_url
      assert_equal 20, assigns(:tickets).count
    end
  end
  
  test "should display 0 tickets" do
    mock_zendesk_hash api_tickets_hash(amount = 0) do 
      get tickets_url
      assert_equal 0, assigns(:tickets).count
    end
  end
  
  
  # can't make pagination assertions since pagination logic comes from the API
  
  
end
