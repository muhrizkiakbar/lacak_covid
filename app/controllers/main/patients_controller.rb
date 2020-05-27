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
      puts "taraaa"
      @main_patients = Main::Patient.all
    end

    if (params[:no_identity].blank?) || (params[:no_identity] == "")
      @no_identity = nil
    else
      @no_identity = params[:no_identity]
      @main_patients = @main_patients.where(no_identity: params[:no_identity])
    end

    if (params[:name].blank?) || (params[:name] == "") ||  (params[:name].nil?)
      @name = nil
    else
      @name = params[:name].downcase
      @main_patients = @main_patients.where("lower(name) LIKE :name", name: "%#{@name}%")

    end

    if (params[:date_of_birth].blank?) || (params[:date_of_birth] == "")
      @date_of_birth = nil
    else
      @date_of_birth = params[:date_of_birth]
      @main_patients = @main_patients.where("lower(date_of_birth) LIKE :date_of_birth", date_of_birth: "%#{@date_of_birth}%")
    end

    if (params[:main_city_id].blank?) || (params[:main_city_id] == "")
      @main_city = nil
    else
      @main_city = Main::City.friendly.find(params[:main_city_id])
      @main_patients = @main_patients.where(main_city_id: @main_city)
    end

    if (params[:main_district_id].blank?) || (params[:main_district_id] == "")
      @main_district = nil
    else
      @main_district = Main::District.friendly.find(params[:main_district_id])
      @main_patients = @main_patients.where(main_district_id: @main_district)
    end

    if (params[:main_sub_district_id].blank?) || (params[:main_sub_district_id] == "")
      @main_sub_district = nil
    else
      @main_sub_district = Main::SubDistrict.friendly.find(params[:main_sub_district_id])
      @main_patients = @main_patients.where(main_sub_district_id: @main_sub_district)
    end

    if (params[:main_citizen_association_id].blank?) || (params[:main_citizen_association_id] == "")
      @main_citizen_association = nil 
    else
      @main_citizen_association = Main::CitizenAssociation.friendly.find(params[:main_citizen_association_id])
      @main_patients = @main_patients.where(main_citizen_association_id: @main_citizen_association)
    end

    if (params[:main_neighborhood_association_id].blank?) || (params[:main_neighborhood_association_id] == "")
      @main_neighborhood_association = nil       
    else
      @main_neighborhood_association = Main::NeighborhoodAssociation.friendly.find(params[:main_neighborhood_association_id])
      @main_patients = @main_patients.where(main_neighborhood_association_id: @main_neighborhood_association)
    end

    if (params[:main_marital_status_id].blank?) || (params[:main_marital_status_id] == "")
      @main_marital_status = nil       
    else
      @main_marital_status = Main::MaritalStatus.friendly.find(params[:main_marital_status_id])
      @main_patients = @main_patients.where(main_marital_status_id: @main_marital_status)
      
    end

    if (params[:name_of_parent].blank?) || (params[:name_of_parent] == "")
      @name_of_parent = nil    
    else
      @name_of_parent = params[:name_of_parent].downcase
      @main_patients = @main_patients.where("lower(name_of_parent) LIKE :name_of_parent", name_of_parent: "%#{@name_of_parent}%")
    end

    if (params[:phone_number].blank?) || (params[:phone_number] == "")
      @phone_number = nil    
    else
      @phone_number = params[:phone_number].downcase
      @main_patients = @main_patients.where("lower(phone_number) LIKE :phone_number", phone_number: "%#{@phone_number}%")
    end

    if (params[:gender].blank?) || (params[:gender] == "")
      @gender = nil   
    else
      @gender = params[:gender].downcase
      @main_patients = @main_patients.where(gender: @gender)
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
