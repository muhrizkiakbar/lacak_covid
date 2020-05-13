class Main::SubDistrictsController < ApplicationController
  before_action :set_main_sub_district, only: [:show, :edit, :update, :destroy]
  before_action :set_main_sub_district_params, except: :search_on_select2_sub_districts
  
  # GET /main/sub_districts
  # GET /main/sub_districts.json
  def index
    @main_sub_districts = Main::SubDistrict.all
  end

  # GET /main/sub_districts/1
  # GET /main/sub_districts/1.json
  def show
  end

  # GET /main/sub_districts/new
  def new
    @main_sub_district = Main::SubDistrict.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/sub_districts/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/sub_districts
  # POST /main/sub_districts.json
  def create
    @main_sub_district = Main::SubDistrict.new(main_sub_district_params)
    @main_sub_district.district = @main_district
    respond_to do |format|
      if @main_sub_district.save
        format.html { redirect_to main_province_city_district_sub_districts_path(@main_province,@main_city,@main_district), notice: 'Sub district was successfully created.' }
        format.json { render :show, status: :created, location: @main_sub_district }
      else
        format.html { render :new }
        format.json { render json: @main_sub_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/sub_districts/1
  # PATCH/PUT /main/sub_districts/1.json
  def update
    respond_to do |format|
      if @main_sub_district.update(main_sub_district_params)
        format.html { redirect_to main_province_city_district_sub_districts_path(@main_province,@main_city,@main_district), notice: 'Sub district was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_sub_district }
      else
        format.html { render :edit }
        format.json { render json: @main_sub_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/sub_districts/1
  # DELETE /main/sub_districts/1.json
  def destroy
    @main_sub_district.destroy
    respond_to do |format|
      format.html { redirect_to main_province_city_district_sub_districts_path(@main_province,@main_city,@main_district), notice: 'Sub district was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_on_select2_sub_districts
    district = Main::District.friendly.find(params["district_id"])
    sub_districts = Main::SubDistrict.where('main_sub_districts.main_district_id = ?',district.id).select("main_sub_districts.slug","main_sub_districts.sub_district")

    if sub_districts
      render :json => sub_districts
    else
        render :json => sub_districts.errors, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_sub_district_params
      @main_province = Main::Province.friendly.find(params[:province_id])
      @main_city = Main::City.friendly.find(params[:city_id])
      @main_district = Main::District.friendly.find(params[:district_id])
    end

    def set_main_sub_district
      @main_sub_district = Main::SubDistrict.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_sub_district_params
      params.require(:main_sub_district).permit(:sub_district)
    end
end
