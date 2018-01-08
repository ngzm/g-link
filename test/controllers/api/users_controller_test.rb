require 'test_helper'

class Api::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get api_users_auth_url
    assert_response :success
  end

end
