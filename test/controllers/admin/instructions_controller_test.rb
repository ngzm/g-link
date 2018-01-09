require 'test_helper'

class Admin::InstructionsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_instructions_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_instructions_update_url
    assert_response :success
  end

end
