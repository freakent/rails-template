class HomeController < ApplicationController

  layout "public"
  skip_before_action :require_login, only: [:show]

  def show
    authorize :public
    @actions = []
    @actions << CardAction.new("Dashboard", dashboard_path, 'developer-g64023225e_640.png', "Let's get started.") if logged_in?
    @actions << CardAction.new("Login", login_path, 'attack-gc05227198_640.png', "If you have already have a username and password, you can sign in here.") if !logged_in?
    @actions << CardAction.new("Register Here", new_user_path, 'subscribe-g69785b659_640.png', "New users can register here.") if !logged_in?
  end

end

