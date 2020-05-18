class Telegram::MessageTravelerObserversController < ApplicationController
  before_action :set_telegram_message_traveler_observer, only: [:show, :edit, :update, :destroy]

  # GET /telegram/message_traveler_observers
  # GET /telegram/message_traveler_observers.json
  def index
    @telegram_message_traveler_observers = Telegram::MessageTravelerObserver.all
    authorize @telegram_message_traveler_observers
  end

  # GET /telegram/message_traveler_observers/1
  # GET /telegram/message_traveler_observers/1.json
  def show
  end

  # GET /telegram/message_traveler_observers/new
  def new
    @telegram_message_traveler_observer = Telegram::MessageTravelerObserver.new
    authorize @telegram_message_traveler_observer
  end

  # GET /telegram/message_traveler_observers/1/edit
  def edit
    authorize @telegram_message_traveler_observer
  end

  # POST /telegram/message_traveler_observers
  # POST /telegram/message_traveler_observers.json
  def create
    @telegram_message_traveler_observer = Telegram::MessageTravelerObserver.new(telegram_message_traveler_observer_params)

    respond_to do |format|
      if @telegram_message_traveler_observer.save
        format.html { redirect_to @telegram_message_traveler_observer, notice: 'Message traveler observer was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_message_traveler_observer }
      else
        format.html { render :new }
        format.json { render json: @telegram_message_traveler_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/message_traveler_observers/1
  # PATCH/PUT /telegram/message_traveler_observers/1.json
  def update
    respond_to do |format|
      if @telegram_message_traveler_observer.update(telegram_message_traveler_observer_params)
        format.html { redirect_to @telegram_message_traveler_observer, notice: 'Message traveler observer was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_message_traveler_observer }
      else
        format.html { render :edit }
        format.json { render json: @telegram_message_traveler_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/message_traveler_observers/1
  # DELETE /telegram/message_traveler_observers/1.json
  def destroy
    authorize @telegram_message_traveler_observer
    @telegram_message_traveler_observer.destroy
    respond_to do |format|
      format.html { redirect_to telegram_message_traveler_observers_url, notice: 'Message traveler observer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_message_traveler_observer
      @telegram_message_traveler_observer = Telegram::MessageTravelerObserver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_message_traveler_observer_params
      params.require(:telegram_message_traveler_observer).permit(:telegram_username_observer_id, :chat_id, :username_telegram, :message)
    end
end
