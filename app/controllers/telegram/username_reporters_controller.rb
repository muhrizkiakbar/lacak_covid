class Telegram::UsernameReportersController < ApplicationController
  before_action :set_telegram_username_reporter, only: [:show, :edit, :update, :destroy]

  # GET /telegram/username_reporters
  # GET /telegram/username_reporters.json
  def index
    @telegram_username_reporters = Telegram::UsernameReporter.all
  end

  # GET /telegram/username_reporters/1
  # GET /telegram/username_reporters/1.json
  def show
  end

  # GET /telegram/username_reporters/new
  def new
    @telegram_username_reporter = Telegram::UsernameReporter.new
  end

  # GET /telegram/username_reporters/1/edit
  def edit
  end

  # POST /telegram/username_reporters
  # POST /telegram/username_reporters.json
  def create
    @telegram_username_reporter = Telegram::UsernameReporter.new(telegram_username_reporter_params)

    respond_to do |format|
      if @telegram_username_reporter.save
        format.html { redirect_to @telegram_username_reporter, notice: 'Username reporter was successfully created.' }
        format.json { render :show, status: :created, location: @telegram_username_reporter }
      else
        format.html { render :new }
        format.json { render json: @telegram_username_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegram/username_reporters/1
  # PATCH/PUT /telegram/username_reporters/1.json
  def update
    respond_to do |format|
      if @telegram_username_reporter.update(telegram_username_reporter_params)
        format.html { redirect_to @telegram_username_reporter, notice: 'Username reporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @telegram_username_reporter }
      else
        format.html { render :edit }
        format.json { render json: @telegram_username_reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegram/username_reporters/1
  # DELETE /telegram/username_reporters/1.json
  def destroy
    @telegram_username_reporter.destroy
    respond_to do |format|
      format.html { redirect_to telegram_username_reporters_url, notice: 'Username reporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram_username_reporter
      @telegram_username_reporter = Telegram::UsernameReporter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_username_reporter_params
      params.require(:telegram_username_reporter).permit(:main_city_id, :main_district_id, :main_sub_district_id, :main_citizen_association_id, :main_neighborhood_association_id, :username_telegram, :last_activity_at)
    end
end
