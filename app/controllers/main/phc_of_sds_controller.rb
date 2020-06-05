class Main::PhcOfSdsController < ApplicationController
  before_action :set_main_phc_of_sd, only: [:show, :edit, :update, :destroy]
  before_action :set_main_phc_of_sd_url
  before_action :set_main_phc_of_sd_params, only: [:update,:create]

  # GET /main/phc_of_sds
  # GET /main/phc_of_sds.json
  def index
    @main_phc_of_sds = Main::PhcOfSd.where(main_public_health_center_id: @main_public_health_center.id)
  end

  # GET /main/phc_of_sds/1
  # GET /main/phc_of_sds/1.json
  def show
  end

  # GET /main/phc_of_sds/new
  def new
    @main_phc_of_sd = Main::PhcOfSd.new
  end

  # GET /main/phc_of_sds/1/edit
  def edit
  end

  # POST /main/phc_of_sds
  # POST /main/phc_of_sds.json
  def create
    @main_phc_of_sd = Main::PhcOfSd.new
    @main_phc_of_sd.public_health_center = @main_public_health_center
    @main_phc_of_sd.sub_district = @main_sub_district
    respond_to do |format|
      if @main_phc_of_sd.save
        format.html { redirect_to main_dinkes_province_dinkes_region_public_health_center_phc_of_sds_path(@main_dinkes_province,@main_dinkes_region,@main_public_health_center), notice: 'Phc of sd was successfully created.' }
        format.json { render :show, status: :created, location: @main_phc_of_sd }
      else
        format.html { render :new }
        format.json { render json: @main_phc_of_sd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/phc_of_sds/1
  # PATCH/PUT /main/phc_of_sds/1.json
  def update
    respond_to do |format|
      @main_phc_of_sd.sub_district = @main_sub_district
      if @main_phc_of_sd.update(main_phc_of_sd_params)
        format.html { redirect_to main_dinkes_province_dinkes_region_public_health_center_phc_of_sds_path(@main_dinkes_province,@main_dinkes_region,@main_public_health_center), notice: 'Phc of sd was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_phc_of_sd }
      else
        format.html { render :edit }
        format.json { render json: @main_phc_of_sd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/phc_of_sds/1
  # DELETE /main/phc_of_sds/1.json
  def destroy
    @main_phc_of_sd.destroy
    respond_to do |format|
      format.html { redirect_to main_dinkes_province_dinkes_region_public_health_center_phc_of_sds_path(@main_dinkes_province,@main_dinkes_region,@main_public_health_center), notice: 'Phc of sd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_phc_of_sd
      @main_phc_of_sd = Main::PhcOfSd.find(params[:id])
    end

    def set_main_phc_of_sd_params
      @main_sub_district = Main::SubDistrict.friendly.find(params[:main_phc_of_sd][:main_sub_district_id])
    end

    def set_main_phc_of_sd_url
      @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:dinkes_region_id])
      @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:dinkes_province_id])
      @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:public_health_center_id])
    end

    # Only allow a list of trusted parameters through.
    def main_phc_of_sd_params
      params.require(:main_phc_of_sd).permit()
    end
end
