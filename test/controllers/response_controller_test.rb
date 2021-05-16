require 'test_helper'

class ResponseControllerTest < ActionDispatch::IntegrationTest
  
  # to ensure application controller can't change it to something else
  API = 'api_request'
  GENERAL = 'general'
  
  
  
  test "direct GET shows no error" do
    get response_url("anything")
    assert_response :success
  end

  test "GET API request has correct show id" do
    get response_url(ApplicationController::API)
    assert_equal API, @controller.params[:id]
  end
  
  test "GET General request has correct show id" do
    get response_url(ApplicationController::GENERAL)
    assert_equal GENERAL, @controller.params[:id]
  end
  
  
  
  
  
  
  test "Bad response GETs the API show page" do
    raises_exception = -> (a,b){ raise Zendesk::APIError.new } 
    
    mock_api_response raises_exception do
      get tickets_url 
      assert_redirected_to response_url(API)
    end
  end
  
  test "General response GETs the General show page" do
    # this is how I interpreted the requirement: 
    # "Tells the user something is wrong if there is a program error"
    raises_exception = -> (a,b){ raise StandardError.new } 
    
    mock_api_response raises_exception do
      get tickets_url 
      assert_redirected_to response_url(GENERAL)
    end
  end
  
  
  
  
  
  def mock_api_response(exception)
    Zendesk.stub :api_response, exception do
      yield
    end
  end
  

end
