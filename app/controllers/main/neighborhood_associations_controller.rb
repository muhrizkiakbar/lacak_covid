class Main::NeighborhoodAssociationsController < ApplicationController
  before_action :set_main_neighborhood_association, only: [:show, :edit, :update, :destroy]

  # GET /main/neighborhood_associations
  # GET /main/neighborhood_associations.json
  def index
    @main_neighborhood_associations = Main::NeighborhoodAssociation.all
  end

  # GET /main/neighborhood_associations/1
  # GET /main/neighborhood_associations/1.json
  def show
  end

  # GET /main/neighborhood_associations/new
  def new
    @main_neighborhood_association = Main::NeighborhoodAssociation.new
  end

  # GET /main/neighborhood_associations/1/edit
  def edit
  end

  # POST /main/neighborhood_associations
  # POST /main/neighborhood_associations.json
  def create
    @main_neighborhood_association = Main::NeighborhoodAssociation.new(main_neighborhood_association_params)

    respond_to do |format|
      if @main_neighborhood_association.save
        format.html { redirect_to @main_neighborhood_association, notice: 'Neighborhood association was successfully created.' }
        format.json { render :show, status: :created, location: @main_neighborhood_association }
      else
        format.html { render :new }
        format.json { render json: @main_neighborhood_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/neighborhood_associations/1
  # PATCH/PUT /main/neighborhood_associations/1.json
  def update
    respond_to do |format|
      if @main_neighborhood_association.update(main_neighborhood_association_params)
        format.html { redirect_to @main_neighborhood_association, notice: 'Neighborhood association was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_neighborhood_association }
      else
        format.html { render :edit }
        format.json { render json: @main_neighborhood_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/neighborhood_associations/1
  # DELETE /main/neighborhood_associations/1.json
  def destroy
    @main_neighborhood_association.destroy
    respond_to do |format|
      format.html { redirect_to main_neighborhood_associations_url, notice: 'Neighborhood association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_main_neighborhood_association_params
      @main_province = Main::Province.friendly.find(params[:main_province_id])
      @main_city = Main::City.friendly.find(params[:main_city_id])
      @main_district = Main::District.find(params[:main_district_id])
      @main_sub_district = Main::SubDistrict.find(params[:main_sub_district_id])
      @main_citizen_association = Main::CitizenAssociation.find(params[:main_citizen_association_id])
    end

    def set_main_neighborhood_association
      @main_neighborhood_association = Main::NeighborhoodAssociation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_neighborhood_association_params
      params.require(:main_neighborhood_association).permit(:neighborhood_association, :main_citizen_association_id)
    end
end
