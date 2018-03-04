require 'test_helper'

class Appl::InformationControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy" do
    get appl_information_privacy_url
    assert_response :success
  end

end
