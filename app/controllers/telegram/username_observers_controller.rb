class Telegram::UsernameObserversController < ApplicationController
  before_action :set_telegram_username_observer, only: [:show, :edit, :update, :destroy]
  before_action :set_telegram_username_observer_params, only: [:create,:update]
  # GET /telegram/username_observers
  # GET /telegram/username_observers.json
  def index
    @search = Telegram::UsernameObserver.ransack(params[:q])
    @telegram_username_observers = @search.result(distinct: true).newest_first.page params[:page]
    authorize @telegram_username_observers
  end

  # GET /telegram/username_observers/1
  # GET /telegram/username_observers/1.json
  def show
  end

  # GET /telegram/username_observers/new
  def new
    @telegram_username_observer = Telegram::UsernameObserver.new
    authorize @telegram_username_observer
    respond_to do |format|
      format.js
    end
  end

  # GET /telegram/username_observers/1/edit
  def edit
    authorize @telegram_username_observer
    respond_to do |format|
      format.js
    end
  end

  # POST /telegram/username_observers
  # POST /telegram/username_observers.json
  def create
    @telegram_username_observer = Telegram::UsernameObserver.new(telegram_username_observer_params)
    @telegram_username_observer.dinkes_province = @main_dinkes_province
    @telegram_username_observer.dinkes_region = @main_dinkes_region
    @telegram_username_observer.hospital = @main_hospital
    @telegram_username_observer.public_health_center = @main_public_health_center
    @telegram_username_observer.user = @user
    @telegram_username_observer.last_activity_at = DateTime.now()
    respond_to do |format|
      if @telegram_username_observer.save
        format.html { redirect_to telegram_username_observers_path, notice: 'Username observer was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_username_observer }
      else
        format.html { render :new }
        format.json { render json: @telegram_username_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/username_observers/1
  # PATCH/PUT /telegram/username_observers/1.json
  def update
    respond_to do |format|
      @telegram_username_observer.dinkes_province = @main_dinkes_province
      @telegram_username_observer.dinkes_region = @main_dinkes_region
      @telegram_username_observer.hospital = @main_hospital
      @telegram_username_observer.public_health_center = @main_public_health_center
      @telegram_username_observer.user = @user
      if @telegram_username_observer.update(telegram_username_observer_params)
        format.html { redirect_to telegram_username_observers_path, notice: 'Username observer was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_username_observer }
      else
        format.html { render :edit }
        format.json { render json: @telegram_username_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/username_observers/1
  # DELETE /telegram/username_observers/1.json
  def destroy
    authorize @telegram_username_observer
    @telegram_username_observer.destroy
    respond_to do |format|
      format.html { redirect_to telegram_username_observers_url, notice: 'Username observer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_username_observer_params
      params[:telegram_username_observer][:main_dinkes_province_id].blank? ? @main_dinkes_province = nil : @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:telegram_username_observer][:main_dinkes_province_id])
      params[:telegram_username_observer][:main_dinkes_region_id].blank? ? @main_dinkes_region = nil : @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:telegram_username_observer][:main_dinkes_region_id])
      params[:telegram_username_observer][:main_hospital_id].blank? ? @main_hospital = nil : @main_hospital = Main::Hospital.friendly.find(params[:telegram_username_observer][:main_hospital_id])
      params[:telegram_username_observer][:main_public_health_center_id].blank? ? @main_public_health_center = nil : @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:telegram_username_observer][:main_public_health_center_id])
      @user = User.friendly.find(params[:telegram_username_observer][:user_id])
    end

    def set_telegram_username_observer
      @telegram_username_observer = Telegram::UsernameObserver.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_username_observer_params
      params.require(:telegram_username_observer).permit(:username_telegram, :name)
    end
end
