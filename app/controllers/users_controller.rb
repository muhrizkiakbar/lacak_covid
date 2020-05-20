class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:show, :destroy]
  before_action :allow_without_password, only: [:update, :update_profile]
  before_action :user_request_params, only: [:create, :update]

  def index
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true).page params[:page]
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
    respond_to do |format|
        format.js
    end

  end

  def create
    @user = User.new(user_full_params)
    @user.dinkes_province = @main_dinkes_province
    @user.dinkes_region = @main_dinkes_region
    @user.hospital = @main_hospital
    @user.public_health_center = @main_public_health_center
    @user.role = @role
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path(), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        # format.html { render :new }
        format.js {  render :action => 'notice'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @user
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      @user.dinkes_province = @main_dinkes_province
      @user.dinkes_region = @main_dinkes_region
      @user.hospital = @main_hospital
      @user.public_health_center = @main_public_health_center
      @user.role = @role
      if @user.update(user_full_params)
        format.html { redirect_to users_path(), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.js
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_profile
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    if !params[:user][:password].blank?

      @user = current_user
      if @user.update_with_password(user_params)
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@user)
        redirect_to show_profile_path, notice: 'You was successfully change profile.'
      else
        render "edit_profile"
      end
    else
      @user = current_user
      if @user.update(user_params)
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@user)
        redirect_to show_profile_path, notice: 'You was successfully change profile.'
      else
        render "edit_profile"
      end

    end
  end

  private
    
    def user_params
      params.require(:user).permit(:email, :username, :password,:password_confirmation,:current_password, :name, :phone_number)
    end

    def user_request_params
      params[:user][:main_dinkes_province_id].nil? ? @main_dinkes_province = nil : @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:user][:main_dinkes_province_id])
      params[:user][:main_dinkes_region_id].nil? ? @main_dinkes_region = nil : @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:user][:main_dinkes_region_id])
      params[:user][:main_hospital_id].nil? ? @main_hospital = nil : @main_hospital = Main::Hospital.friendly.find(params[:user][:main_hospital_id])
      params[:user][:main_public_health_center_id].nil? ? @main_public_health_center = nil : @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:user][:main_public_health_center_id])
      @role = Role.friendly.find(params[:user][:role_id])
    end

    def user_full_params
      params.require(:user).permit(:email, :username, :password,:password_confirmation, :name, :phone_number, :avatar)
    end

    def set_user
      @user = User.friendly.find(params[:id])
    end

    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
          params[:user].delete(:current_password)
      end
    end
end
