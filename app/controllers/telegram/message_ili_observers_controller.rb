class Telegram::MessageIliObserversController < ApplicationController
  before_action :set_telegram_message_ili_observer, only: [:show, :edit, :update, :destroy]

  # GET /telegram/message_ili_observers
  # GET /telegram/message_ili_observers.json
  def index
    @telegram_message_ili_observers = Telegram::MessageIliObserver.all
    authorize @telegram_message_ili_observers
  end

  # GET /telegram/message_ili_observers/1
  # GET /telegram/message_ili_observers/1.json
  def show
  end

  # GET /telegram/message_ili_observers/new
  def new
    @telegram_message_ili_observer = Telegram::MessageIliObserver.new
    authorize @telegram_message_ili_observer
  end

  # GET /telegram/message_ili_observers/1/edit
  def edit
    authorize @telegram_message_ili_observer
  end

  # POST /telegram/message_ili_observers
  # POST /telegram/message_ili_observers.json
  def create
    @telegram_message_ili_observer = Telegram::MessageIliObserver.new(telegram_message_ili_observer_params)

    respond_to do |format|
      if @telegram_message_ili_observer.save
        format.html { redirect_to @telegram_message_ili_observer, notice: 'Message ili observer was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_message_ili_observer }
      else
        format.html { render :new }
        format.json { render json: @telegram_message_ili_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/message_ili_observers/1
  # PATCH/PUT /telegram/message_ili_observers/1.json
  def update
    respond_to do |format|
      if @telegram_message_ili_observer.update(telegram_message_ili_observer_params)
        format.html { redirect_to @telegram_message_ili_observer, notice: 'Message ili observer was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_message_ili_observer }
      else
        format.html { render :edit }
        format.json { render json: @telegram_message_ili_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/message_ili_observers/1
  # DELETE /telegram/message_ili_observers/1.json
  def destroy
    authorize @telegram_message_ili_observer
    @telegram_message_ili_observer.destroy
    respond_to do |format|
      format.html { redirect_to telegram_message_ili_observers_url, notice: 'Message ili observer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_message_ili_observer
      @telegram_message_ili_observer = Telegram::MessageIliObserver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_message_ili_observer_params
      params.require(:telegram_message_ili_observer).permit(:telegram_username_observer_id, :chat_id, :username_telegram, :message)
    end
end
