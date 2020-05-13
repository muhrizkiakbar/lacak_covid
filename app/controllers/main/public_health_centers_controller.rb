class Main::PublicHealthCentersController < ApplicationController
  before_action :set_main_public_health_center, only: [:show, :edit, :update, :destroy]
  before_action :set_main_public_health_center_url
  # GET /main/public_health_centers
  # GET /main/public_health_centers.json
  def index
    @main_public_health_centers = Main::PublicHealthCenter.all
  end

  # GET /main/public_health_centers/1
  # GET /main/public_health_centers/1.json
  def show
  end

  # GET /main/public_health_centers/new
  def new
    @main_public_health_center = Main::PublicHealthCenter.new
  end

  # GET /main/public_health_centers/1/edit
  def edit
  end

  # POST /main/public_health_centers
  # POST /main/public_health_centers.json
  def create
    @main_public_health_center = Main::PublicHealthCenter.new(main_public_health_center_params)
    @main_public_health_center.hospital = @main_hospital
    respond_to do |format|
      if @main_public_health_center.save
        format.html { redirect_to main_dinkes_province_dinkes_region_hospital_public_health_centers_path(@main_dinkes_province,@main_dinkes_region,@main_hospital), notice: 'Public health center was successfully created.' }
        format.json { render :show, status: :created, location: @main_public_health_center }
      else
        format.html { render :new }
        format.json { render json: @main_public_health_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/public_health_centers/1
  # PATCH/PUT /main/public_health_centers/1.json
  def update
    respond_to do |format|
      if @main_public_health_center.update(main_public_health_center_params)
        format.html { redirect_to main_dinkes_province_dinkes_region_hospital_public_health_centers_path(@main_dinkes_province,@main_dinkes_region,@main_hospital), notice: 'Public health center was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_public_health_center }
      else
        format.html { render :edit }
        format.json { render json: @main_public_health_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/public_health_centers/1
  # DELETE /main/public_health_centers/1.json
  def destroy
    @main_public_health_center.destroy
    respond_to do |format|
      format.html { redirect_to main_dinkes_province_dinkes_region_hospital_public_health_centers_path(@main_dinkes_province,@main_dinkes_region,@main_hospital), notice: 'Public health center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_public_health_center_url
      @main_hospital = Main::Hospital.friendly.find(params[:hospital_id])
      @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:dinkes_region_id])
      @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:dinkes_province_id])
    end
    def set_main_public_health_center
      @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_public_health_center_params
      params.require(:main_public_health_center).permit(:public_health_center)
    end
end