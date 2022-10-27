class HomeController < ApplicationController

  layout "public"
  skip_before_action :require_login, only: [:index]

  def index
  end
end
