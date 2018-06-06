require 'test_helper'

class Api::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get api_contacts_new_url
    assert_response :success
  end

  test "should get create" do
    get api_contacts_create_url
    assert_response :success
  end

end
