class Main::DinkesProvincesController < ApplicationController
  before_action :set_main_dinkes_province, only: [:show, :edit, :update, :destroy]

  # GET /main/dinkes_provinces
  # GET /main/dinkes_provinces.json
  def index
    @main_dinkes_provinces = Main::DinkesProvince.all
  end

  # GET /main/dinkes_provinces/1
  # GET /main/dinkes_provinces/1.json
  def show
  end

  # GET /main/dinkes_provinces/new
  def new
    @main_dinkes_province = Main::DinkesProvince.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/dinkes_provinces/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/dinkes_provinces
  # POST /main/dinkes_provinces.json
  def create
    @main_dinkes_province = Main::DinkesProvince.new(main_dinkes_province_params)

    respond_to do |format|
      if @main_dinkes_province.save
        format.html { redirect_to main_dinkes_provinces_url, notice: 'Dinkes province was successfully created.' }
        format.json { render :show, status: :created, location: @main_dinkes_province }
      else
        format.html { render :new }
        format.json { render json: @main_dinkes_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/dinkes_provinces/1
  # PATCH/PUT /main/dinkes_provinces/1.json
  def update
    respond_to do |format|
      if @main_dinkes_province.update(main_dinkes_province_params)
        format.html { redirect_to main_dinkes_provinces_url, notice: 'Dinkes province was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_dinkes_province }
      else
        format.html { render :edit }
        format.json { render json: @main_dinkes_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/dinkes_provinces/1
  # DELETE /main/dinkes_provinces/1.json
  def destroy
    @main_dinkes_province.destroy
    respond_to do |format|
      format.html { redirect_to main_dinkes_provinces_url, notice: 'Dinkes province was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_dinkes_province
      @main_dinkes_province = Main::DinkesProvince.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_dinkes_province_params
      params.require(:main_dinkes_province).permit(:dinkes_province)
    end
end
