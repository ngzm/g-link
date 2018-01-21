require 'test_helper'

class Api::RankingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_ranking_index_url
    assert_response :success
  end

end
