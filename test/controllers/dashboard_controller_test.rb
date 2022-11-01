require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    login_user(users(:fred))
    get dashboard_url
    assert_response :success
  end
end
