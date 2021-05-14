require 'test_helper'

class ResponseControllerTest < ActionDispatch::IntegrationTest
  test "direct GET request shows no error" do
    get response_url("anything")
    assert_response :success
  end

end
