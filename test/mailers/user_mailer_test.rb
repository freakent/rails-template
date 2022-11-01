require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:fred)
  end

  test "activation_needed_email" do
    @user.setup_activation
    @user.save
    mail = UserMailer.activation_needed_email(@user)
    assert_equal "<application name> - Please confirm your email", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["admin@example.com"], mail.from
    #assert_match "activation", mail.body.encoded
  end

  test "activation_success_email" do
    mail = UserMailer.activation_success_email(@user)
    assert_equal "<application name> - Welcome", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["admin@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

end
