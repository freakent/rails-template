class UsersController < ApplicationController
  layout "public", except: [:index, :show, :edit]
  before_action :set_user, only: %i[ show edit update destroy]
  skip_before_action :require_login, only: [:new, :create, :activate] # this should only be used if you are allowing users to register themselves. 

  # GET /users or /users.json
  def index
    @users = policy_scope(User.all)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = authorize User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = authorize User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url(@user), notice: "User was successfully created." } #TODO: should redirect to email verification screen
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def activate
    authorize User
    @user = User.load_from_activation_token(params[:id])
    if @user
      @user.activate!
      redirect_to login_path, :notice => 'User was successfully activated. Please log in to continue.'
    else
      redirect_to root_path, :alert => "Email confirmation token not accepted."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = authorize User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end
end
