# app/controllers/user_sessions_controller.rb
class UserSessionsController < ApplicationController

  layout "public"
  skip_before_action :require_login, only: [:new, :create]

  # GET /users_sessions/new
  def new
    @user_session = authorize UserSession.new
  end

  # POST /user_sessions or /user_sessions.json
  def create
    @user_session = authorize UserSession.new(user_session_params)
    if @user_session.valid?
      @user = login(@user_session.email, @user_session.password) 
      @user_session.errors.add :base, :invalid, message: "Invalid username or password, login denied" unless @user
    end

    respond_to do |format|
      if @user
        format.html { redirect_back_or_to(:dashboard, notice: 'Login successful')}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def old_create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:dashboard, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new', status: :unprocessable_entity
    end
  end

  def destroy
    authorize UserSession
    logout
    redirect_to(:root, notice: 'Logged out!')
  end

private

    # Only allow a list of trusted parameters through.
    def user_session_params
        params.require(:user_session).permit(:email, :password)
    end

end