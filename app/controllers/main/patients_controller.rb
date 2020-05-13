class Main::PatientsController < ApplicationController
  before_action :set_main_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_main_patien_params_request, only: [:create,:update]
  # GET /main/patients
  # GET /main/patients.json
  def index
    @main_patients = Main::Patient.all
  end

  # GET /main/patients/1
  # GET /main/patients/1.json
  def show
  end

  # GET /main/patients/new
  def new
    @main_patient = Main::Patient.new
  end

  # GET /main/patients/1/edit
  def edit
  end

  # POST /main/patients
  # POST /main/patients.json
  def create
    @main_patient = Main::Patient.new(main_patient_params)
    @main_patient.tribe = @main_tribe
    @main_patient.city = @main_city
    @main_patient.district = @main_district
    @main_patient.sub_district = @main_sub_district
    @main_patient.citizen_association = @main_citizen_association
    @main_patient.neighborhood_association = @main_neighborhood_association
    @main_patient.marital_status = @main_marital_status
    respond_to do |format|
      if @main_patient.save
        format.html { redirect_to @main_patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @main_patient }
      else
        format.html { render :new }
        format.json { render json: @main_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/patients/1
  # PATCH/PUT /main/patients/1.json
  def update
    respond_to do |format|
      @main_patient.tribe = @main_tribe
      @main_patient.city = @main_city
      @main_patient.district = @main_district
      @main_patient.sub_district = @main_sub_district
      @main_patient.citizen_association = @main_citizen_association
      @main_patient.neighborhood_association = @main_neighborhood_association
      @main_patient.marital_status = @main_marital_status
      if @main_patient.update(main_patient_params)
        format.html { redirect_to @main_patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_patient }
      else
        format.html { render :edit }
        format.json { render json: @main_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/patients/1
  # DELETE /main/patients/1.json
  def destroy
    @main_patient.destroy
    respond_to do |format|
      format.html { redirect_to main_patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_main_patien_params_request
      @main_tribe = Main::Tribe.friendly.find(params[:main_patient][:main_tribe_id])
      @main_city = Main::City.friendly.find(params[:main_patient][:main_city_id])
      @main_district = Main::District.friendly.find(params[:main_patient][:main_district_id])
      @main_sub_district = Main::SubDistrict.friendly.find(params[:main_patient][:main_sub_district_id])
      @main_citizen_association = Main::CitizenAssociation.friendly.find(params[:main_patient][:main_citizen_association_id])
      @main_neighborhood_association = Main::NeighborhoodAssociation.friendly.find(params[:main_patient][:main_neighborhood_association_id])
      @main_marital_status = Main::MaritalStatus.friendly.find(params[:main_patient][:main_marital_status_id])
    end

    def set_main_patient
      @main_patient = Main::Patient.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_patient_params
      params.require(:main_patient).permit(:no_identity, :name_of_parent, :name, :address, :phone_number, :date_of_birth, :gender)
    end
end
