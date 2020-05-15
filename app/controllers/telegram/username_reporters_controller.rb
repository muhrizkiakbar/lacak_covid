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
    @telegram_username_reporter.city = @main_city
    @telegram_username_reporter.district = @main_district
    @telegram_username_reporter.sub_district = @main_sub_district
    @telegram_username_reporter.citizen_association = @main_citizen_association
    @telegram_username_reporter.neighborhood_association = @main_neighborhood_association
    username_telegram = @main_sub_district.id + "_" + @main_citizen_association.id + "_" + @main_neighborhood_association.id 
    @telegram_username_reporter.username_telegram = username_telegram
    @telegram_username_reporter.last_activity_at = DateTime.now()
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
      @telegram_username_reporter.city = @main_city
      @telegram_username_reporter.district = @main_district
      @telegram_username_reporter.sub_district = @main_sub_district
      @telegram_username_reporter.citizen_association = @main_citizen_association
      @telegram_username_reporter.neighborhood_association = @main_neighborhood_association
      username_telegram = @main_sub_district.id + "_" + @main_citizen_association.id + "_" + @main_neighborhood_association.id 
      @telegram_username_reporter.username_telegram = username_telegram
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

    def set_telegram_username_reporter_params
      @main_city = Main::City.friendly.find(params[:main_patient][:main_city_id])
      @main_district = Main::District.friendly.find(params[:main_patient][:main_district_id])
      @main_sub_district = Main::SubDistrict.friendly.find(params[:main_patient][:main_sub_district_id])
      @main_citizen_association = Main::CitizenAssociation.friendly.find(params[:main_patient][:main_citizen_association_id])
      @main_neighborhood_association = Main::NeighborhoodAssociation.friendly.find(params[:main_patient][:main_neighborhood_association_id])
    end

    def set_telegram_username_reporter
      @telegram_username_reporter = Telegram::UsernameReporter.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_username_reporter_params
      params.require(:telegram_username_reporter).permit()
    end
end
