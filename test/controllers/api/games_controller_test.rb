require 'test_helper'

class Api::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get api_games_play_url
    assert_response :success
  end

end
