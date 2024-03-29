class Telegram::MessageTravelerReportersController < ApplicationController
  before_action :set_telegram_message_traveler_reporter, only: [:show, :edit, :update, :destroy]

  # GET /telegram/message_traveler_reporters
  # GET /telegram/message_traveler_reporters.json
  def index
    @telegram_message_traveler_reporters = Telegram::MessageTravelerReporter.all
    authorize @telegram_message_traveler_reporters
  end

  # GET /telegram/message_traveler_reporters/1
  # GET /telegram/message_traveler_reporters/1.json
  def show
  end

  # GET /telegram/message_traveler_reporters/new
  def new
    @telegram_message_traveler_reporter = Telegram::MessageTravelerReporter.new
    authorize @telegram_message_traveler_reporter
  end

  # GET /telegram/message_traveler_reporters/1/edit
  def edit
    authorize @telegram_message_traveler_reporter
  end

  # POST /telegram/message_traveler_reporters
  # POST /telegram/message_traveler_reporters.json
  def create
    @telegram_message_traveler_reporter = Telegram::MessageTravelerReporter.new(telegram_message_traveler_reporter_params)

    respond_to do |format|
      if @telegram_message_traveler_reporter.save
        format.html { redirect_to @telegram_message_traveler_reporter, notice: 'Message traveler reporter was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_message_traveler_reporter }
      else
        format.html { render :new }
        format.json { render json: @telegram_message_traveler_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/message_traveler_reporters/1
  # PATCH/PUT /telegram/message_traveler_reporters/1.json
  def update
    respond_to do |format|
      if @telegram_message_traveler_reporter.update(telegram_message_traveler_reporter_params)
        format.html { redirect_to @telegram_message_traveler_reporter, notice: 'Message traveler reporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_message_traveler_reporter }
      else
        format.html { render :edit }
        format.json { render json: @telegram_message_traveler_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/message_traveler_reporters/1
  # DELETE /telegram/message_traveler_reporters/1.json
  def destroy
    authorize @telegram_message_traveler_reporter
    @telegram_message_traveler_reporter.destroy
    respond_to do |format|
      format.html { redirect_to telegram_message_traveler_reporters_url, notice: 'Message traveler reporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_message_traveler_reporter
      @telegram_message_traveler_reporter = Telegram::MessageTravelerReporter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_message_traveler_reporter_params
      params.require(:telegram_message_traveler_reporter).permit(:telegram_username_reporter_id, :chat_id, :username_telegram, :message)
    end
end
