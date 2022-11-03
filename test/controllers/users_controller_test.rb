require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:fred)
    @superuser = users(:superuser)
  end

  test "should be able to activate with valid token" do
    @user.setup_activation
    assert_equal 'pending', @user.activation_state 
    @user.save
    get activate_user_url(@user.activation_token)
    @user.reload
    assert_equal 'active', @user.activation_state 
    assert_redirected_to login_url
  end

  test "should not be able to activate with in-valid token" do
    @user.setup_activation
    assert_equal 'pending', @user.activation_state 
    @user.save
    get activate_user_url('aaaabbbbccccddddeeeeffff')
    @user.reload
    assert_equal 'pending', @user.activation_state 
    assert_redirected_to root_url
  end

  test "should get index" do
    login_user(@superuser)
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: "newuser@example.com", first_name: @user.first_name, last_name: @user.last_name, password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to root_url #user_url(User.last)
  end

  test "should show user" do
    login_user(@user)
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    login_user(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    login_user(@user)
    patch user_url(@user), params: { user: { crypted_password: @user.crypted_password, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, salt: @user.salt } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    login_user(@superuser)
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
