class UsersController < ApplicationController
#extend Mailboxer::Models::Messageable::ActiveRecordExtension
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_account, only: :destroy
  #acts_as_messageable
  # GET /users
  # GET /users.json

  def index
    @users = User.all
  end

  def current_user?(user)
    user == current_user
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  def get_user(set_user)

  end

  def profile
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
    @account_type_option = {}
    @account_type_option["Parent"] = "Parent"
    @account_type_option["Legal Guardian"] = "Legal Guardian"
    @account_type_option["Tutor"] = "Tutor"


  end

  # GET /users/1/edit
  def edit
    @account_type_option = {}
    @account_type_option["Parent"] = "Parent"
    @account_type_option["Legal Guardian"] = "Legal Guardian"
    @account_type_option["Tutor"] = "Tutor"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @account_type_option = {}
    @account_type_option["Parent"] = "Parent"
    @account_type_option["Legal Guardian"] = "Legal Guardian"
    @account_type_option["Tutor"] = "Tutor"
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        flash[:success] = 'ACCOUNT CREATED'
        format.json { render :show, status: :created, location: @user }
        log_in @user
      else
        format.html { render :new }
        flash[:danger] = 'Error: fill in all fields'
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @account_type_option = {}
    @account_type_option["Parent"] = "Parent"
    @account_type_option["Legal Guardian"] = "Legal Guardian"
    @account_type_option["Tutor"] = "Tutor"
    @user = current_user
    if @user.update_attributes(user_params)
        flash[:success] = "Account was successfully updated."
        redirect_to profile_path
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, alert: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :city, :about_me,:account_type, :password, :password_confirmation)
    end

    def admin_account
      redirect_to(root_url) unless current_user.admin?
    end
end
