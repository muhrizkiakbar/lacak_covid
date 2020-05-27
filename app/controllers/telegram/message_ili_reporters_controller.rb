class Telegram::MessageIliReportersController < ApplicationController
  before_action :set_telegram_message_ili_reporter, only: [:show, :edit, :update, :destroy]

  # GET /telegram/message_ili_reporters
  # GET /telegram/message_ili_reporters.json
  def index
    @telegram_message_ili_reporters = Telegram::MessageIliReporter.ransack(params[:q])

    if (current_user.role.is_dinkes_region) || (current_user.role.is_public_health_center)
      if (current_user.role.is_dinkes_region)
        @telegram_message_ili_reporters = @search.result(distinct: true).joins(:username_reporter).where("telegram_username_reporters.main_city_id = ?", current_user.dinkes_region.city.id).newest_first.page params[:page]
      else
        @telegram_message_ili_reporters = @search.result(distinct: true).joins(:username_reporter).where("telegram_username_reporters.main_sub_district_id = ?", current_user.public_health_center.sub_district.id).newest_first.page params[:page]
      end
    else
      @telegram_message_ili_reporters = @search.result(distinct: true).newest_first.page params[:page]
    end
    authorize @telegram_message_ili_reporters
  end

  # GET /telegram/message_ili_reporters/1
  # GET /telegram/message_ili_reporters/1.json
  def show
  end

  # GET /telegram/message_ili_reporters/new
  def new
    @telegram_message_ili_reporter = Telegram::MessageIliReporter.new
    authorize @telegram_message_ili_reporter
  end

  # GET /telegram/message_ili_reporters/1/edit
  def edit
    authorize @telegram_message_ili_reporter
  end

  # POST /telegram/message_ili_reporters
  # POST /telegram/message_ili_reporters.json
  def create
    @telegram_message_ili_reporter = Telegram::MessageIliReporter.new(telegram_message_ili_reporter_params)

    respond_to do |format|
      if @telegram_message_ili_reporter.save
        format.html { redirect_to @telegram_message_ili_reporter, notice: 'Message ili reporter was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_message_ili_reporter }
      else
        format.html { render :new }
        format.json { render json: @telegram_message_ili_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/message_ili_reporters/1
  # PATCH/PUT /telegram/message_ili_reporters/1.json
  def update
    respond_to do |format|
      if @telegram_message_ili_reporter.update(telegram_message_ili_reporter_params)
        format.html { redirect_to @telegram_message_ili_reporter, notice: 'Message ili reporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_message_ili_reporter }
      else
        format.html { render :edit }
        format.json { render json: @telegram_message_ili_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/message_ili_reporters/1
  # DELETE /telegram/message_ili_reporters/1.json
  def destroy
    authorize @telegram_message_ili_reporter
    @telegram_message_ili_reporter.destroy
    respond_to do |format|
      format.html { redirect_to telegram_message_ili_reporters_url, notice: 'Message ili reporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_message_ili_reporter
      @telegram_message_ili_reporter = Telegram::MessageIliReporter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_message_ili_reporter_params
      params.require(:telegram_message_ili_reporter).permit(:telegram_username_reporter_id, :chat_id, :username_telegram, :message)
    end
end
