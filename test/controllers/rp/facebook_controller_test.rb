require 'test_helper'

class Rp::FacebookControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rp_facebook_show_url
    assert_response :success
  end

  test "should get create" do
    get rp_facebook_create_url
    assert_response :success
  end

end
