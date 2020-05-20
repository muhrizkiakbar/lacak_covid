class Main::CitiesController < ApplicationController
  before_action :set_main_city, only: [:show, :edit, :update, :destroy]
  before_action :set_main_city_params, except: :search_on_select2_cities

  # GET /main/cities
  # GET /main/cities.json
  def index
    @main_cities = Main::City.where(main_province_id: @main_province.id).page params[:page]
    authorize @main_cities
  end

  # GET /main/cities/1
  # GET /main/cities/1.json
  def show
  end

  # GET /main/cities/new
  def new
    @main_city = Main::City.new
    authorize @main_city
    respond_to do |format|
      format.js
    end
  end

  # GET /main/cities/1/edit
  def edit
    authorize @main_city
    respond_to do |format|
      format.js
    end
  end

  # POST /main/cities
  # POST /main/cities.json
  def create
    @main_city = Main::City.new(main_city_params)
    @main_city.province = @main_province

    # authorize @main_city
    respond_to do |format|
      if @main_city.save
        format.html { redirect_to main_province_cities_path(@main_province), notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @main_city }
      else
        format.html { render :new }
        format.js { render "errors" }
        format.json { render json: @main_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/cities/1
  # PATCH/PUT /main/cities/1.json
  def update
    respond_to do |format|

      # authorize @main_city
      if @main_city.update(main_city_params)
        format.html { redirect_to main_province_cities_path(@main_province), notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_city }
      else
        format.html { render :edit }
        format.js { render "errors" }
        format.json { render json: @main_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/cities/1
  # DELETE /main/cities/1.json
  def destroy

    authorize @main_city
    @main_city.destroy
    respond_to do |format|
      format.html { redirect_to main_province_cities_path(@main_province), notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_on_select2_cities
    province = Main::Province.friendly.find(params["province_id"])
    cities = Main::City.where('main_cities.main_province_id = ?',province.id).select("main_cities.slug","main_cities.city")

    if cities
      render :json => cities
    else
        render :json => cities.errors, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_city_params
      @main_province = Main::Province.friendly.find(params[:province_id])
    end

    def set_main_city
      @main_city = Main::City.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_city_params
      params.require(:main_city).permit(:city)
    end
end
