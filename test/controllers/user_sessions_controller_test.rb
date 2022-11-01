require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:fred)
  end 

  test "should show login page" do
    get login_url
    assert_response :success
  end

  test "should login" do
    post login_url, params: { user_session: { email: @user.email, password: 'secret' }} # ensure that the password you set here conforms to what you have set in your fixtures/factory. and also ensure that your session creation URL is set appropriately: whether it be: user_sessions_path (if you have been following the tutorials) or otherwise.
    follow_redirect!
    assert_response :success
  end

  test "should logout" do
    login_user(@user)
    post logout_url
    follow_redirect!
    assert_response :success
  end
end
