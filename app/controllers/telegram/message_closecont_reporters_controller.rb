class Telegram::MessageClosecontReportersController < ApplicationController
  before_action :set_telegram_message_closecont_reporter, only: [:show, :edit, :update, :destroy]

  # GET /telegram/message_closecont_reporters
  # GET /telegram/message_closecont_reporters.json
  def index
    @telegram_message_closecont_reporters = Telegram::MessageClosecontReporter.all
    authorize @telegram_message_closecont_reporters
  end

  # GET /telegram/message_closecont_reporters/1
  # GET /telegram/message_closecont_reporters/1.json
  def show
  end

  # GET /telegram/message_closecont_reporters/new
  def new
    @telegram_message_closecont_reporter = Telegram::MessageClosecontReporter.new
    authorize @telegram_message_closecont_reporter
  end

  # GET /telegram/message_closecont_reporters/1/edit
  def edit
    authorize @telegram_message_closecont_reporter
  end

  # POST /telegram/message_closecont_reporters
  # POST /telegram/message_closecont_reporters.json
  def create
    @telegram_message_closecont_reporter = Telegram::MessageClosecontReporter.new(telegram_message_closecont_reporter_params)

    respond_to do |format|
      if @telegram_message_closecont_reporter.save
        format.html { redirect_to @telegram_message_closecont_reporter, notice: 'Message closecont reporter was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_message_closecont_reporter }
      else
        format.html { render :new }
        format.json { render json: @telegram_message_closecont_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/message_closecont_reporters/1
  # PATCH/PUT /telegram/message_closecont_reporters/1.json
  def update
    respond_to do |format|
      if @telegram_message_closecont_reporter.update(telegram_message_closecont_reporter_params)
        format.html { redirect_to @telegram_message_closecont_reporter, notice: 'Message closecont reporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_message_closecont_reporter }
      else
        format.html { render :edit }
        format.json { render json: @telegram_message_closecont_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/message_closecont_reporters/1
  # DELETE /telegram/message_closecont_reporters/1.json
  def destroy
    authorize @telegram_message_closecont_reporter
    @telegram_message_closecont_reporter.destroy
    respond_to do |format|
      format.html { redirect_to telegram_message_closecont_reporters_url, notice: 'Message closecont reporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_message_closecont_reporter
      @telegram_message_closecont_reporter = Telegram::MessageClosecontReporter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_message_closecont_reporter_params
      params.require(:telegram_message_closecont_reporter).permit(:telegram_username_reporter_id, :chat_id, :username_telegram, :message)
    end
end
