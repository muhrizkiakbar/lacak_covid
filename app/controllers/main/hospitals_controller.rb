class Main::HospitalsController < ApplicationController
  before_action :set_main_hospital, only: [:show, :edit, :update, :destroy]
  before_action :set_main_hospital_url
  # GET /main/hospitals
  # GET /main/hospitals.json
  def index
    @search = Main::Hospital.ransack(params[:q])
    @main_hospitals = @search.result(distinct: true).where(main_dinkes_region_id: @main_dinkes_region.id).page params[:page]
    authorize @main_hospitals
  end

  # GET /main/hospitals/1
  # GET /main/hospitals/1.json
  def show
  end

  # GET /main/hospitals/new
  def new
    @main_hospital = Main::Hospital.new
    authorize @main_hospital
    respond_to do |format|
      format.js
    end
  end

  # GET /main/hospitals/1/edit
  def edit
    authorize @main_hospital
    respond_to do |format|
      format.js
    end
  end

  # POST /main/hospitals
  # POST /main/hospitals.json
  def create
    @main_hospital = Main::Hospital.new(main_hospital_params)
    @main_hospital.dinkes_region = @main_dinkes_region
    respond_to do |format|
      if @main_hospital.save
        format.html { redirect_to main_dinkes_province_dinkes_region_hospitals_path(@main_dinkes_province,@main_dinkes_region), notice: 'Hospital was successfully created.' }
        format.json { render :show, status: :created, location: @main_hospital }
      else
        format.html { render :new }
        format.json { render json: @main_hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/hospitals/1
  # PATCH/PUT /main/hospitals/1.json
  def update
    respond_to do |format|
      if @main_hospital.update(main_hospital_params)
        format.html { redirect_to main_dinkes_province_dinkes_region_hospitals_path(@main_dinkes_province,@main_dinkes_region), notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_hospital }
      else
        format.html { render :edit }
        format.json { render json: @main_hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/hospitals/1
  # DELETE /main/hospitals/1.json
  def destroy
    authorize @main_hospital
    @main_hospital.destroy
    respond_to do |format|
      format.html { redirect_to main_dinkes_province_dinkes_region_hospitals_path(@main_dinkes_province,@main_dinkes_region), notice: 'Hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_hospital_url
      @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:dinkes_region_id])
      @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:dinkes_province_id])
    end

    def set_main_hospital
      @main_hospital = Main::Hospital.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_hospital_params
      params.require(:main_hospital).permit(:hospital, :is_primary)
    end
end
