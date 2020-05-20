class Main::DinkesRegionsController < ApplicationController
  before_action :set_main_dinkes_region, only: [:show, :edit, :update, :destroy]
  before_action :set_main_dinkes_region_url
  before_action :set_main_dinkes_region_params, only: [:create, :update]
  
  # GET /main/dinkes_regions
  # GET /main/dinkes_regions.json
  def index
    @main_dinkes_regions = Main::DinkesRegion.where(main_dinkes_province_id: @main_dinkes_province.id).page params[:page]
    authorize @main_dinkes_regions
  end

  # GET /main/dinkes_regions/1
  # GET /main/dinkes_regions/1.json
  def show
  end

  # GET /main/dinkes_regions/new
  def new
    @main_dinkes_region = Main::DinkesRegion.new
    authorize @main_dinkes_region
    respond_to do |format|
      format.js
    end
  end

  # GET /main/dinkes_regions/1/edit
  def edit
    authorize @main_dinkes_region
    respond_to do |format|
      format.js
    end
  end

  # POST /main/dinkes_regions
  # POST /main/dinkes_regions.json
  def create
    @main_dinkes_region = Main::DinkesRegion.new(main_dinkes_region_params)
    @main_dinkes_region.dinkes_province = @main_dinkes_province
    @main_dinkes_region.city = @main_city
    respond_to do |format|
      if @main_dinkes_region.save
        format.html { redirect_to main_dinkes_province_dinkes_regions_path(@main_dinkes_province), notice: 'Dinkes region was successfully created.' }
        format.json { render :show, status: :created, location: @main_dinkes_region }
      else
        format.html { render :new }
        format.json { render json: @main_dinkes_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/dinkes_regions/1
  # PATCH/PUT /main/dinkes_regions/1.json
  def update
    respond_to do |format|
      if @main_dinkes_region.update(main_dinkes_region_params)
        format.html { redirect_to main_dinkes_province_dinkes_regions_path(@main_dinkes_province), notice: 'Dinkes region was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_dinkes_region }
      else
        format.html { render :edit }
        format.json { render json: @main_dinkes_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/dinkes_regions/1
  # DELETE /main/dinkes_regions/1.json
  def destroy
    authorize @main_dinkes_region
    @main_dinkes_region.destroy
    respond_to do |format|
      format.html { redirect_to main_dinkes_province_dinkes_regions_path(@main_dinkes_province), notice: 'Dinkes region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_dinkes_region_url
      @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:dinkes_province_id])
    end

    def set_main_dinkes_region_params
      @main_city = Main::City.friendly.find(params[:main_dinkes_region][:main_city_id])
    end

    def set_main_dinkes_region
      @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_dinkes_region_params
      params.require(:main_dinkes_region).permit(:dinkes_region)
    end
end
