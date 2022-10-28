# app/controllers/user_sessions_controller.rb
class UserSessionsController < ApplicationController

  layout "public"
  skip_before_action :require_login, only: [:new, :create]

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:dashboard, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end