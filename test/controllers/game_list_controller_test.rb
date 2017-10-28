require 'test_helper'

class GameListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_list_index_url
    assert_response :success
  end

end
