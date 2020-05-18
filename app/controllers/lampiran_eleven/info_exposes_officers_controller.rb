class LampiranEleven::InfoExposesOfficersController < ApplicationController
  before_action :set_lampiran_eleven_info_exposes_officer, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_info_exposes_officer_url
  before_action :set_lampiran_eleven_info_exposes_officer_params, only: [:create, :update]

  # GET /lampiran_eleven/info_exposes_officers
  # GET /lampiran_eleven/info_exposes_officers.json
  def index
    @lampiran_eleven_info_exposes_officers = LampiranEleven::InfoExposesOfficer.all
    authorize @lampiran_eleven_info_exposes_officers
  end

  # GET /lampiran_eleven/info_exposes_officers/1
  # GET /lampiran_eleven/info_exposes_officers/1.json
  def show
  end

  # GET /lampiran_eleven/info_exposes_officers/new
  def new
    @lampiran_eleven_info_exposes_officer = LampiranEleven::InfoExposesOfficer.new
    authorize @lampiran_eleven_info_exposes_officer
    # if !@lampiran_eleven_close_contact_information.info_exposes_officer.nil?
    #   redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_close_contact_information.info_exposes_officer), notice: 'Info exposes officer has been filled, you only can edit.'
    # end
  end

  # GET /lampiran_eleven/info_exposes_officers/1/edit
  def edit
    authorize @lampiran_eleven_info_exposes_officer
  end

  # POST /lampiran_eleven/info_exposes_officers
  # POST /lampiran_eleven/info_exposes_officers.json
  def create
    @lampiran_eleven_info_exposes_officer = LampiranEleven::InfoExposesOfficer.new(lampiran_eleven_info_exposes_officer_params)
    @lampiran_eleven_info_exposes_officer.close_contact_information= @lampiran_eleven_close_contact_information
    @lampiran_eleven_info_exposes_officer.dinkes_province = @main_dinkes_province
    @lampiran_eleven_info_exposes_officer.dinkes_region = @main_dinkes_region
    @lampiran_eleven_info_exposes_officer.hospital = @main_hospital
    @lampiran_eleven_info_exposes_officer.public_health_center = @main_public_health_center
    @lampiran_eleven_info_exposes_officer.job_position = @main_job_position
    respond_to do |format|
      if @lampiran_eleven_info_exposes_officer.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_info_exposes_officer_contact_symptom_path(
          @lampiran_eleven_close_contact_information,
          @lampiran_eleven_info_exposes_officer), notice: 'Info exposes officer was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_info_exposes_officer }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_info_exposes_officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/info_exposes_officers/1
  # PATCH/PUT /lampiran_eleven/info_exposes_officers/1.json
  def update
    respond_to do |format|
      @lampiran_eleven_info_exposes_officer.dinkes_province = @main_dinkes_province
      @lampiran_eleven_info_exposes_officer.dinkes_region = @main_dinkes_region
      @lampiran_eleven_info_exposes_officer.hospital = @main_hospital
      @lampiran_eleven_info_exposes_officer.public_health_center = @main_public_health_center
      @lampiran_eleven_info_exposes_officer.job_position = @main_job_position
      if @lampiran_eleven_info_exposes_officer.update(lampiran_eleven_info_exposes_officer_params)
        format.html { redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer), notice: 'Info exposes officer was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_info_exposes_officer }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_info_exposes_officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/info_exposes_officers/1
  # DELETE /lampiran_eleven/info_exposes_officers/1.json
  def destroy
    authorize @lampiran_eleven_info_exposes_officer
    @lampiran_eleven_info_exposes_officer.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_info_exposes_officers_path(@lampiran_eleven_close_contact_information), notice: 'Info exposes officer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_info_exposes_officer_params
      puts "=" * 100
      @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:lampiran_eleven_info_exposes_officer][:main_dinkes_province_id])
      @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:lampiran_eleven_info_exposes_officer][:main_dinkes_region_id])
      @main_hospital = Main::Hospital.friendly.find(params[:lampiran_eleven_info_exposes_officer][:main_hospital_id])
      @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:lampiran_eleven_info_exposes_officer][:main_public_health_center_id])
      @main_job_position = Main::JobPosition.friendly.find(params[:lampiran_eleven_info_exposes_officer][:main_job_position_id])

    end

    def set_lampiran_eleven_info_exposes_officer_url
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end

    def set_lampiran_eleven_info_exposes_officer
      @lampiran_eleven_info_exposes_officer = LampiranEleven::InfoExposesOfficer.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_info_exposes_officer_params
      params.require(:lampiran_eleven_info_exposes_officer).permit(:is_gown_self,:is_medic_mask_self,:is_gloves_self, :is_n95_ffp2_self, :is_n99_ffp3_self, :is_goggle_self, :isn_apd_self, :is_gown_aerosol, :is_medic_mask_aerosol, :is_gloves_aerosol, :is_n95_ffp2_aerosol, :is_n99_ffp3_aerosol, :is_goggle_aerosol, :isn_apd_aerosol,:is_contact_physic_with_positive, :is_procedure_aerosol, :explain_of_procedure_aerosol)
    end
end
