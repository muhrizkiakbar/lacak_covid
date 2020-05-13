class Main::CitizenAssociationsController < ApplicationController
  before_action :set_main_citizen_association, only: [:show, :edit, :update, :destroy]
  before_action :set_main_citizen_association_params
  
  # GET /main/citizen_associations
  # GET /main/citizen_associations.json
  def index
    @main_citizen_associations = Main::CitizenAssociation.all
  end

  # GET /main/citizen_associations/1
  # GET /main/citizen_associations/1.json
  def show
  end

  # GET /main/citizen_associations/new
  def new
    @main_citizen_association = Main::CitizenAssociation.new
  end

  # GET /main/citizen_associations/1/edit
  def edit
  end

  # POST /main/citizen_associations
  # POST /main/citizen_associations.json
  def create
    @main_citizen_association = Main::CitizenAssociation.new(main_citizen_association_params)
    @main_citizen_association.main_sub_district = @main_sub_district
    respond_to do |format|
      if @main_citizen_association.save
        format.html { redirect_to @main_citizen_association, notice: 'Citizen association was successfully created.' }
        format.json { render :show, status: :created, location: @main_citizen_association }
      else
        format.html { render :new }
        format.json { render json: @main_citizen_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/citizen_associations/1
  # PATCH/PUT /main/citizen_associations/1.json
  def update
    respond_to do |format|
      if @main_citizen_association.update(main_citizen_association_params)
        format.html { redirect_to @main_citizen_association, notice: 'Citizen association was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_citizen_association }
      else
        format.html { render :edit }
        format.json { render json: @main_citizen_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/citizen_associations/1
  # DELETE /main/citizen_associations/1.json
  def destroy
    @main_citizen_association.destroy
    respond_to do |format|
      format.html { redirect_to main_citizen_associations_url, notice: 'Citizen association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_main_citizen_association_params
      @main_province = Main::Province.friendly.find(params[:province_id])
      @main_city = Main::City.friendly.find(params[:city_id])
      @main_district = Main::District.find(params[:district_id])
      @main_sub_district = Main::SubDistrict.find(params[:sub_district_id])
    end

    def set_main_citizen_association
      @main_citizen_association = Main::CitizenAssociation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_citizen_association_params
      params.require(:main_citizen_association).permit(:citizen_association)
    end
end
