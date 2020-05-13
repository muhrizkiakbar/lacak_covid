class Main::SubDistrictsController < ApplicationController
  before_action :set_main_sub_district, only: [:show, :edit, :update, :destroy]
  before_action :set_main_sub_district_params
  
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
  end

  # GET /main/sub_districts/1/edit
  def edit
  end

  # POST /main/sub_districts
  # POST /main/sub_districts.json
  def create
    @main_sub_district = Main::SubDistrict.new(main_sub_district_params)
    @main_sub_district.main_district = @main_district
    respond_to do |format|
      if @main_sub_district.save
        format.html { redirect_to @main_sub_district, notice: 'Sub district was successfully created.' }
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
        format.html { redirect_to @main_sub_district, notice: 'Sub district was successfully updated.' }
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
      format.html { redirect_to main_sub_districts_url, notice: 'Sub district was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_sub_district_params
      @main_province = Main::Province.friendly.find(params[:main_province_id])
      @main_city = Main::City.friendly.find(params[:main_city_id])
      @main_district = Main::District.find(params[:main_district_id])
    end

    def set_main_sub_district
      @main_sub_district = Main::SubDistrict.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_sub_district_params
      params.require(:main_sub_district).permit(:sub_district)
    end
end
