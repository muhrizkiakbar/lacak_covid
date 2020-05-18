class Telegram::MessageCheckinReportersController < ApplicationController
  before_action :set_telegram_message_checkin_reporter, only: [:show, :edit, :update, :destroy]

  # GET /telegram/message_checkin_reporters
  # GET /telegram/message_checkin_reporters.json
  def index
    @telegram_message_checkin_reporters = Telegram::MessageCheckinReporter.all
    authorize @telegram_message_checkin_reporters
  end

  # GET /telegram/message_checkin_reporters/1
  # GET /telegram/message_checkin_reporters/1.json
  def show
  end

  # GET /telegram/message_checkin_reporters/new
  def new
    @telegram_message_checkin_reporter = Telegram::MessageCheckinReporter.new
    authorize @telegram_message_checkin_reporter
  end

  # GET /telegram/message_checkin_reporters/1/edit
  def edit
    authorize @telegram_message_checkin_reporter
  end

  # POST /telegram/message_checkin_reporters
  # POST /telegram/message_checkin_reporters.json
  def create
    @telegram_message_checkin_reporter = Telegram::MessageCheckinReporter.new(telegram_message_checkin_reporter_params)

    respond_to do |format|
      if @telegram_message_checkin_reporter.save
        format.html { redirect_to @telegram_message_checkin_reporter, notice: 'Message checkin reporter was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_message_checkin_reporter }
      else
        format.html { render :new }
        format.json { render json: @telegram_message_checkin_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/message_checkin_reporters/1
  # PATCH/PUT /telegram/message_checkin_reporters/1.json
  def update
    respond_to do |format|
      if @telegram_message_checkin_reporter.update(telegram_message_checkin_reporter_params)
        format.html { redirect_to @telegram_message_checkin_reporter, notice: 'Message checkin reporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_message_checkin_reporter }
      else
        format.html { render :edit }
        format.json { render json: @telegram_message_checkin_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/message_checkin_reporters/1
  # DELETE /telegram/message_checkin_reporters/1.json
  def destroy
    authorize @telegram_message_checkin_reporter
    @telegram_message_checkin_reporter.destroy
    respond_to do |format|
      format.html { redirect_to telegram_message_checkin_reporters_url, notice: 'Message checkin reporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_message_checkin_reporter
      @telegram_message_checkin_reporter = Telegram::MessageCheckinReporter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_message_checkin_reporter_params
      params.require(:telegram_message_checkin_reporter).permit(:telegram_username_reporter_id, :chat_id, :username_telegram)
    end
end
