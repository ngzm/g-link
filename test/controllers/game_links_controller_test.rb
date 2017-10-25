require 'test_helper'

class GameLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_link = game_links(:one)
  end

  test "should get index" do
    get game_links_url
    assert_response :success
  end

  test "should get new" do
    get new_game_link_url
    assert_response :success
  end

  test "should create game_link" do
    assert_difference('GameLink.count') do
      post game_links_url, params: { game_link: { access: @game_link.access, category1: @game_link.category1, category2: @game_link.category2, category3: @game_link.category3, description: @game_link.description, img: @game_link.img, star: @game_link.star, title: @game_link.title, url: @game_link.url } }
    end

    assert_redirected_to game_link_url(GameLink.last)
  end

  test "should show game_link" do
    get game_link_url(@game_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_link_url(@game_link)
    assert_response :success
  end

  test "should update game_link" do
    patch game_link_url(@game_link), params: { game_link: { access: @game_link.access, category1: @game_link.category1, category2: @game_link.category2, category3: @game_link.category3, description: @game_link.description, img: @game_link.img, star: @game_link.star, title: @game_link.title, url: @game_link.url } }
    assert_redirected_to game_link_url(@game_link)
  end

  test "should destroy game_link" do
    assert_difference('GameLink.count', -1) do
      delete game_link_url(@game_link)
    end

    assert_redirected_to game_links_url
  end
end
