require 'test_helper'

class Api::MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_main_index_url
    assert_response :success
  end

end
