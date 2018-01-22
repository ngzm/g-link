require 'test_helper'

class Admin::AdvertisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advertise = advertises(:one)
  end

  test "should get index" do
    get advertises_url
    assert_response :success
  end

  test "should get new" do
    get new_advertise_url
    assert_response :success
  end

  test "should create advertise" do
    assert_difference('Advertise.count') do
      post advertises_url, params: { advertise: {  } }
    end

    assert_redirected_to advertise_url(Advertise.last)
  end

  test "should show advertise" do
    get advertise_url(@advertise)
    assert_response :success
  end

  test "should get edit" do
    get edit_advertise_url(@advertise)
    assert_response :success
  end

  test "should update advertise" do
    patch advertise_url(@advertise), params: { advertise: {  } }
    assert_redirected_to advertise_url(@advertise)
  end

  test "should destroy advertise" do
    assert_difference('Advertise.count', -1) do
      delete advertise_url(@advertise)
    end

    assert_redirected_to advertises_url
  end
end
