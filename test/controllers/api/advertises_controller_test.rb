require 'test_helper'

class Api::AdvertisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_advertises_index_url
    assert_response :success
  end

  test "should get search" do
    get api_advertises_search_url
    assert_response :success
  end

end
