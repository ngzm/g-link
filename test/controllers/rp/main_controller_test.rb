require 'test_helper'

class Rp::MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rp_main_index_url
    assert_response :success
  end

end
