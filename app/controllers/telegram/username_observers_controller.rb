class Telegram::UsernameObserversController < ApplicationController
  before_action :set_telegram_username_observer, only: [:show, :edit, :update, :destroy]

  # GET /telegram/username_observers
  # GET /telegram/username_observers.json
  def index
    @telegram_username_observers = Telegram::UsernameObserver.all
  end

  # GET /telegram/username_observers/1
  # GET /telegram/username_observers/1.json
  def show
  end

  # GET /telegram/username_observers/new
  def new
    @telegram_username_observer = Telegram::UsernameObserver.new
  end

  # GET /telegram/username_observers/1/edit
  def edit
  end

  # POST /telegram/username_observers
  # POST /telegram/username_observers.json
  def create
    @telegram_username_observer = Telegram::UsernameObserver.new(telegram_username_observer_params)

    respond_to do |format|
      if @telegram_username_observer.save
        format.html { redirect_to @telegram_username_observer, notice: 'Username observer was successfully created.' }
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
      if @telegram_username_observer.update(telegram_username_observer_params)
        format.html { redirect_to @telegram_username_observer, notice: 'Username observer was successfully updated.' }
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
    @telegram_username_observer.destroy
    respond_to do |format|
      format.html { redirect_to telegram_username_observers_url, notice: 'Username observer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_username_observer
      @telegram_username_observer = Telegram::UsernameObserver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_username_observer_params
      params.require(:telegram_username_observer).permit(:main_dinkes_province_id, :main_dinkes_region_id, :main_hospital_id, :main_public_health_center_id, :user_id, :username_telegram, :last_activity_at)
    end
end
