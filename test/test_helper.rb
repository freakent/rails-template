ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Sorcery::TestHelpers::Rails
end

class ActionDispatch::IntegrationTest
  include Sorcery::TestHelpers::Rails::Integration

  def login_user(user)
    # post the login and follow through
    post login_path, params: { user_session: { email: user.email, password: 'secret' }} # ensure that the password you set here conforms to what you have set in your fixtures/factory. and also ensure that your session creation URL is set appropriately: whether it be: user_sessions_path (if you have been following the tutorials) or otherwise.
    follow_redirect!
  end
end