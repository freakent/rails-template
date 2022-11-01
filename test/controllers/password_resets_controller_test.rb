require "test_helper"

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "should create password reset" do
    get password_resets_create_url params: [:email] 
    follow_redirect!
    assert_response :success
  end

  test "should get edit" do
    get password_resets_edit_url
    follow_redirect!
    assert_response :success
  end

  test "should get update" do
    get password_resets_update_url
    follow_redirect!
    assert_response :success
  end
end
