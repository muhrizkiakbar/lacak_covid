class Main::CitiesController < ApplicationController
  before_action :set_main_city, only: [:show, :edit, :update, :destroy]

  # GET /main/cities
  # GET /main/cities.json
  def index
    @main_cities = Main::City.all
  end

  # GET /main/cities/1
  # GET /main/cities/1.json
  def show
  end

  # GET /main/cities/new
  def new
    @main_city = Main::City.new
  end

  # GET /main/cities/1/edit
  def edit
  end

  # POST /main/cities
  # POST /main/cities.json
  def create
    @main_city = Main::City.new(main_city_params)

    respond_to do |format|
      if @main_city.save
        format.html { redirect_to @main_city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @main_city }
      else
        format.html { render :new }
        format.json { render json: @main_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/cities/1
  # PATCH/PUT /main/cities/1.json
  def update
    respond_to do |format|
      if @main_city.update(main_city_params)
        format.html { redirect_to @main_city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_city }
      else
        format.html { render :edit }
        format.json { render json: @main_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/cities/1
  # DELETE /main/cities/1.json
  def destroy
    @main_city.destroy
    respond_to do |format|
      format.html { redirect_to main_cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_city
      @main_city = Main::City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_city_params
      params.require(:main_city).permit(:city, :main_province_id)
    end
end
