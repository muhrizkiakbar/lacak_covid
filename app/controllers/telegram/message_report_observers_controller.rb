class Telegram::MessageReportObserversController < ApplicationController
  before_action :set_telegram_message_report_observer, only: [:show, :edit, :update, :destroy]

  # GET /telegram/message_report_observers
  # GET /telegram/message_report_observers.json
  def index
    @telegram_message_report_observers = Telegram::MessageReportObserver.all
  end

  # GET /telegram/message_report_observers/1
  # GET /telegram/message_report_observers/1.json
  def show
  end

  # GET /telegram/message_report_observers/new
  def new
    @telegram_message_report_observer = Telegram::MessageReportObserver.new
  end

  # GET /telegram/message_report_observers/1/edit
  def edit
  end

  # POST /telegram/message_report_observers
  # POST /telegram/message_report_observers.json
  def create
    @telegram_message_report_observer = Telegram::MessageReportObserver.new(telegram_message_report_observer_params)

    respond_to do |format|
      if @telegram_message_report_observer.save
        format.html { redirect_to @telegram_message_report_observer, notice: 'Message report observer was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_message_report_observer }
      else
        format.html { render :new }
        format.json { render json: @telegram_message_report_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/message_report_observers/1
  # PATCH/PUT /telegram/message_report_observers/1.json
  def update
    respond_to do |format|
      if @telegram_message_report_observer.update(telegram_message_report_observer_params)
        format.html { redirect_to @telegram_message_report_observer, notice: 'Message report observer was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_message_report_observer }
      else
        format.html { render :edit }
        format.json { render json: @telegram_message_report_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/message_report_observers/1
  # DELETE /telegram/message_report_observers/1.json
  def destroy
    @telegram_message_report_observer.destroy
    respond_to do |format|
      format.html { redirect_to telegram_message_report_observers_url, notice: 'Message report observer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_message_report_observer
      @telegram_message_report_observer = Telegram::MessageReportObserver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_message_report_observer_params
      params.require(:telegram_message_report_observer).permit(:telegram_username_observer_id, :username_telegram, :message)
    end
end
