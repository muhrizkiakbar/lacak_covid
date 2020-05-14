class Main::SetLocationsController < ApplicationController
  before_action :set_main_set_location, only: [:show, :edit, :update, :destroy]

  # GET /main/set_locations
  # GET /main/set_locations.json
  def index
    @main_set_locations = Main::SetLocation.all
  end

  # GET /main/set_locations/1
  # GET /main/set_locations/1.json
  def show
  end

  # GET /main/set_locations/new
  def new
    @main_set_location = Main::SetLocation.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/set_locations/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/set_locations
  # POST /main/set_locations.json
  def create
    @main_set_location = Main::SetLocation.new(main_set_location_params)

    respond_to do |format|
      if @main_set_location.save
        format.html { redirect_to main_set_locations_path, notice: 'Set location was successfully created.' }
        format.json { render :show, status: :created, location: @main_set_location }
      else
        format.html { render :new }
        format.js { render "errors" }
        format.json { render json: @main_set_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/set_locations/1
  # PATCH/PUT /main/set_locations/1.json
  def update
    respond_to do |format|
      if @main_set_location.update(main_set_location_params)
        format.html { redirect_to main_set_locations_path, notice: 'Set location was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_set_location }
      else
        format.html { render :edit }
        format.js { render "errors" }
        format.json { render json: @main_set_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/set_locations/1
  # DELETE /main/set_locations/1.json
  def destroy
    @main_set_location.destroy
    respond_to do |format|
      format.html { redirect_to main_set_locations_url, notice: 'Set location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_set_location
      @main_set_location = Main::SetLocation.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_set_location_params
      params.require(:main_set_location).permit(:set_location)
    end
end
