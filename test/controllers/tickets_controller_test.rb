require 'test_helper'


class TicketsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    
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
  end
  
  #haven't figured out how to mock the object HTTP yet, 
  # so direct calls to the API still occur
  test "should get index" do
    get tickets_url
    assert_response :success
    
    # assert_equal "index", @controller.action_name
    # assert_equal "application/json", @request.media_type
  end

  test "should show ticket" do
    get ticket_url(1)
    assert_response :success
  end


  test "pagination" do
    get tickets_url(page=3)
    assert_response :success
  end
  
  test "non existing ticket redirects to response#show" do
    # ideally the tickets would be mocked and an id higher would be passed in
    get ticket_url(10000)
    assert_redirected_to response_url(ApplicationController::API)
  end
end
