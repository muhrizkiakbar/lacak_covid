class LContactList::ContactPatientsController < ApplicationController
  before_action :set_l_contact_list_contact_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_l_contact_list_contact_patient_url
  before_action :set_l_contact_list_contact_patient_request, only: [:create, :update]
  # GET /l_contact_list/contact_patients
  # GET /l_contact_list/contact_patients.json
  def index
    @l_contact_list_contact_patients = LContactList::ContactPatient.all
    #authorize @l_contact_list_contact_patients
  end

  # GET /l_contact_list/contact_patients/1
  # GET /l_contact_list/contact_patients/1.json
  def show
    #authorize @l_contact_list_contact_patient
  end

  # GET /l_contact_list/contact_patients/new
  def new
    @l_contact_list_contact_patient = LContactList::ContactPatient.new
    respond_to do |format|
      format.js
    end
    #authorize @l_contact_list_contact_patient
  end

  # GET /l_contact_list/contact_patients/1/edit
  def edit
    respond_to do |format|
      format.js
    end
    #authorize @l_contact_list_contact_patient
  end

  # POST /l_contact_list/contact_patients
  # POST /l_contact_list/contact_patients.json
  def create
    @l_contact_list_contact_patient = LContactList::ContactPatient.new(l_contact_list_contact_patient_params)
    @l_contact_list_contact_patient.contact_list = @l_contact_list_contact_list
    @l_contact_list_contact_patient.patient_child = @main_patient_child
    @l_contact_list_contact_patient.patient = @main_patient

    respond_to do |format|
      if @l_contact_list_contact_patient.save
        format.html { redirect_to l_contact_list_contact_list_contact_patient_path(@l_contact_list_contact_list,@l_contact_list_contact_patient), notice: 'Contact patient was successfully created.' }
        format.json { render :show, status: :created, location: @l_contact_list_contact_patient }
      else
        format.html { render :new }
        format.json { render json: @l_contact_list_contact_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_contact_list/contact_patients/1
  # PATCH/PUT /l_contact_list/contact_patients/1.json
  def update
    respond_to do |format|
      @l_contact_list_contact_patient.patient = @main_patient
      @l_contact_list_contact_patient.patient_child = @main_patient_child
      if @l_contact_list_contact_patient.update(l_contact_list_contact_patient_params)
        format.html { redirect_to l_contact_list_contact_list_contact_patient_path(@l_contact_list_contact_list,@l_contact_list_contact_patient), notice: 'Contact patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_contact_list_contact_patient }
      else
        format.html { render :edit }
        format.json { render json: @l_contact_list_contact_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_contact_list/contact_patients/1
  # DELETE /l_contact_list/contact_patients/1.json
  def destroy
    authorize @l_contact_list_contact_patient
    @l_contact_list_contact_patient.destroy
    respond_to do |format|
      format.html { redirect_to l_contact_list_contact_list_path(@l_contact_list_contact_list), notice: 'Contact patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_contact_list_contact_patient
      @l_contact_list_contact_patient = LContactList::ContactPatient.find(params[:id])
    end

    def set_l_contact_list_contact_patient_url
      @l_contact_list_contact_list = LContactList::ContactList.friendly.find(params[:contact_list_id]) 
    end

    def set_l_contact_list_contact_patient_request
      @main_patient = @l_contact_list_contact_list.patient
      @main_patient_child = Main::Patient.friendly.find(params[:l_contact_list_contact_patient][:main_patient_child_id])
    end

    # Only allow a list of trusted parameters through.
    def l_contact_list_contact_patient_params
      params.require(:l_contact_list_contact_patient).permit()
    end
end
