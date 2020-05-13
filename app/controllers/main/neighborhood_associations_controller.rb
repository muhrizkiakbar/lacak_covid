class Main::NeighborhoodAssociationsController < ApplicationController
  before_action :set_main_neighborhood_association, only: [:show, :edit, :update, :destroy]
  before_action :set_main_neighborhood_association_params
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
    @main_neighborhood_association.citizen_association = @main_citizen_association
    respond_to do |format|
      if @main_neighborhood_association.save
        format.html { redirect_to main_province_city_district_sub_district_citizen_association_neighborhood_association_path(@main_province,@main_city,@main_district,@main_sub_district,@main_citizen_association,@main_neighborhood_association), notice: 'Neighborhood association was successfully created.' }
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
        format.html { redirect_to main_province_city_district_sub_district_citizen_association_neighborhood_association_path(@main_province,@main_city,@main_district,@main_sub_district,@main_citizen_association,@main_neighborhood_association), notice: 'Neighborhood association was successfully updated.' }
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
      format.html { redirect_to main_province_city_district_sub_district_citizen_association_neighborhood_associations_path(@main_province,@main_city,@main_district,@main_sub_district,@main_citizen_association), notice: 'Neighborhood association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_main_neighborhood_association_params
      @main_province = Main::Province.friendly.find(params[:province_id])
      @main_city = Main::City.friendly.find(params[:city_id])
      @main_district = Main::District.friendly.find(params[:district_id])
      @main_sub_district = Main::SubDistrict.friendly.find(params[:sub_district_id])
      @main_citizen_association = Main::CitizenAssociation.friendly.find(params[:citizen_association_id])
    end

    def set_main_neighborhood_association
      @main_neighborhood_association = Main::NeighborhoodAssociation.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_neighborhood_association_params
      params.require(:main_neighborhood_association).permit(:neighborhood_association)
    end
end
