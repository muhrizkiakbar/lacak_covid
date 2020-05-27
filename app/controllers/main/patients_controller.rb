class Main::PatientsController < ApplicationController
  before_action :set_main_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_main_patien_params_request, only: [:create,:update]
  # GET /main/patients
  # GET /main/patients.json
  def index
    if (current_user.role.is_dinkes_region) || (current_user.role.is_public_health_center)
      if (current_user.role.is_dinkes_region)
        @main_patients = Main::Patient.where(main_city_id: current_user.dinkes_region.city.id)
      else
        @main_patients = Main::Patient.where(main_public_health_center_id: current_user.public_health_center.id)
      end
    else
      @main_patients = Main::Patient.all
    end

    if !(params[:no_identity].blank?)
      @no_identity = params[:no_identity]
      @main_patients = @main_patients.where(no_identity: params[:no_identity])
    else
      @no_identity = nil
    end

    if !(params[:name].blank?)
      @name = params[:name]
      @main_patients = @main_patients.where("name LIKE :name", name: "%#{@name}%")

    else
      @name = nil
    end

    if !(params[:date_of_birth].blank?)
      @date_of_birth = params[:date_of_birth]
      @main_patients = @main_patients.where("date_of_birth LIKE :date_of_birth", date_of_birth: "%#{@date_of_birth}%")
    else
      @date_of_birth = nil
    end

    if !(params[:main_city_id].blank?)
      @main_city = Main::City.friendly.find(params[:main_city_id])
      @main_patients = @main_patients.where(main_city_id: @main_city)
    else
      @main_city = nil
    end

    if !(params[:main_district_id].blank?)
      @main_district = Main::District.friendly.find(params[:main_district_id])
      @main_patients = @main_patients.where(main_district_id: @main_district)
    else
      @main_district = nil
    end

    if !(params[:main_sub_district_id].blank?)
      @main_sub_district = Main::SubDistrict.friendly.find(params[:main_sub_district_id])
      @main_patients = @main_patients.where(main_sub_district_id: @main_sub_district)
    else
      @main_sub_district = nil
    end

    if !(params[:main_citizen_association_id].blank?)
      @main_citizen_association = Main::CitizenAssociation.friendly.find(params[:main_citizen_association_id])
      @main_patients = @main_patients.where(main_citizen_association_id: @main_citizen_association)
    else
      @main_citizen_association = nil 
    end

    if !(params[:main_neighborhood_association_id].blank?)
      @main_neighborhood_association = Main::NeighborhoodAssociation.friendly.find(params[:main_neighborhood_association_id])
      @main_patients = @main_patients.where(main_neighborhood_association_id: @main_neighborhood_association)
    else
      @main_neighborhood_association = nil       
    end

    if !(params[:main_marital_status_id].blank?)

      @main_marital_status = Main::MaritalStatus.friendly.find(params[:main_marital_status_id])
      @main_patients = @main_patients.where(main_marital_status_id: @main_marital_status)
    else
      @main_marital_status = nil       
      
    end

    if !(params[:name_of_parent].blank?)
     
      @name_of_parent = params[:name_of_parent]
      @main_patients = @main_patients.where("name_of_parent LIKE :name_of_parent", name_of_parent: "%#{@name_of_parent}%")
    else
      @name_of_parent = nil    
    end

    if !(params[:phone_number].blank?)
      
      @phone_number = params[:phone_number]
      @main_patients = @main_patients.where("phone_number LIKE :phone_number", phone_number: "%#{@phone_number}%")
    else
      @phone_number = nil    
    end

    if !(params[:gender].blank?)
      @gender = params[:gender]
      @main_patients = @main_patients.where(gender: @gender)
    else
      @gender = nil   
      
    end

    @main_patients = @main_patients.page params[:page]
    authorize @main_patients
  end

  # GET /main/patients/1
  # GET /main/patients/1.json
  def show
  end

  # GET /main/patients/new
  def new
    @main_patient = Main::Patient.new

    authorize @main_patient
    respond_to do |format|
      format.js
    end
  end

  # GET /main/patients/1/edit
  def edit
    authorize @main_patient
    respond_to do |format|
      format.js
    end
  end

  # POST /main/patients
  # POST /main/patients.json
  def create
    @main_patient = Main::Patient.new(main_patient_params)
    @main_patient.city = @main_city
    @main_patient.district = @main_district
    @main_patient.sub_district = @main_sub_district
    @main_patient.citizen_association = @main_citizen_association
    @main_patient.neighborhood_association = @main_neighborhood_association
    @main_patient.marital_status = @main_marital_status
    respond_to do |format|
      if @main_patient.save
        format.html { redirect_to main_patients_path, notice: 'Patient was successfully created.' }
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
      @main_patient.city = @main_city
      @main_patient.district = @main_district
      @main_patient.sub_district = @main_sub_district
      @main_patient.citizen_association = @main_citizen_association
      @main_patient.neighborhood_association = @main_neighborhood_association
      @main_patient.marital_status = @main_marital_status
      if @main_patient.update(main_patient_params)
        format.html { redirect_to main_patients_path, notice: 'Patient was successfully updated.' }
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
    authorize @main_patient
    @main_patient.destroy
    respond_to do |format|
      format.html { redirect_to main_patients_path, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_main_patien_params_request
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
