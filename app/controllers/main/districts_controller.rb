class Main::DistrictsController < ApplicationController
  before_action :set_main_district, only: [:show, :edit, :update, :destroy]
  before_action :set_main_district_params
  # GET /main/districts
  # GET /main/districts.json
  def index
    @main_districts = Main::District.all
  end

  # GET /main/districts/1
  # GET /main/districts/1.json
  def show
  end

  # GET /main/districts/new
  def new
    @main_district = Main::District.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/districts/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/districts
  # POST /main/districts.json
  def create
    @main_district = Main::District.new(main_district_params)
    @main_district.city = @main_city
    respond_to do |format|
      if @main_district.save
        format.html { redirect_to main_province_city_districts_path(@main_province,@main_city), notice: 'District was successfully created.' }
        format.json { render :show, status: :created, location: @main_district }
      else
        format.html { render :new }
        format.json { render json: @main_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/districts/1
  # PATCH/PUT /main/districts/1.json
  def update
    respond_to do |format|
      if @main_district.update(main_district_params)
        format.html { redirect_to main_province_city_districts_path(@main_province,@main_city), notice: 'District was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_district }
      else
        format.html { render :edit }
        format.json { render json: @main_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/districts/1
  # DELETE /main/districts/1.json
  def destroy
    @main_district.destroy
    respond_to do |format|
      format.html { redirect_to main_province_city_districts_path(@main_province,@main_city), notice: 'District was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search_on_select2_district
    city = Main::City.friendly.find(params["city_id"])
    districts = Main::District.where('main_districts.main_city_id = ?',city.id).select("main_districts.slug","main_districts.district")

    if districts
      render :json => districts
    else
        render :json => districts.errors, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_district_params
      @main_province = Main::Province.friendly.find(params[:province_id])
      @main_city = Main::City.friendly.find(params[:city_id])
    end

    def set_main_district
      @main_district = Main::District.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_district_params
      params.require(:main_district).permit(:district)
    end
end
