require 'test_helper'

class ResponseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get response_index_url
    assert_response :success
  end

end
