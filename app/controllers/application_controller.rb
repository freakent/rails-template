class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :require_login
    after_action :verify_authorized, except: :index # Ensure Pundit Policies are invoked, see authorize
    after_action :verify_policy_scoped, only: :index # Ensure Pundit Scope Policies are invoked, see scope.resolve

    private
    def not_authenticated
      redirect_to login_path, :alert => "First log in to view this page."
    end
end
