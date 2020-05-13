class Main::ProvincesController < ApplicationController
  before_action :set_main_province, only: [:show, :edit, :update, :destroy]

  # GET /main/provinces
  # GET /main/provinces.json
  def index
    @main_provinces = Main::Province.all
  end

  # GET /main/provinces/1
  # GET /main/provinces/1.json
  def show
  end

  # GET /main/provinces/new
  def new
    @main_province = Main::Province.new
  end

  # GET /main/provinces/1/edit
  def edit
  end

  # POST /main/provinces
  # POST /main/provinces.json
  def create
    @main_province = Main::Province.new(main_province_params)

    respond_to do |format|
      if @main_province.save
        format.html { redirect_to main_provinces_url, notice: 'Province was successfully created.' }
        format.json { render :show, status: :created, location: @main_province }
      else
        format.html { render :new }
        format.json { render json: @main_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/provinces/1
  # PATCH/PUT /main/provinces/1.json
  def update
    respond_to do |format|
      if @main_province.update(main_province_params)
        format.html { redirect_to main_provinces_url, notice: 'Province was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_province }
      else
        format.html { render :edit }
        format.json { render json: @main_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/provinces/1
  # DELETE /main/provinces/1.json
  def destroy
    @main_province.destroy
    respond_to do |format|
      format.html { redirect_to main_provinces_url, notice: 'Province was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_province
      @main_province = Main::Province.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_province_params
      params.require(:main_province).permit(:province)
    end
end
