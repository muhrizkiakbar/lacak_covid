class LampiranEleven::OtherSymptomsController < ApplicationController
  before_action :set_lampiran_eleven_other_symptom, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_other_symptom_url
  # GET /lampiran_eleven/other_symptoms
  # GET /lampiran_eleven/other_symptoms.json
  def index
    @lampiran_eleven_other_symptoms = LampiranEleven::OtherSymptom.all
  end

  # GET /lampiran_eleven/other_symptoms/1
  # GET /lampiran_eleven/other_symptoms/1.json
  def show
  end

  # GET /lampiran_eleven/other_symptoms/new
  def new
    @lampiran_eleven_other_symptom = LampiranEleven::OtherSymptom.new
    if !@lampiran_eleven_info_exposes_officer.other_symptom.nil?
      redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_other_symptom_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer,@lampiran_eleven_info_exposes_officer.other_symptom), notice: 'Other symptom has been filled, you only can edit.' 
    end
  end

  # GET /lampiran_eleven/other_symptoms/1/edit
  def edit
  end

  # POST /lampiran_eleven/other_symptoms
  # POST /lampiran_eleven/other_symptoms.json
  def create
    @lampiran_eleven_other_symptom = LampiranEleven::OtherSymptom.new(lampiran_eleven_other_symptom_params)
    @lampiran_eleven_other_symptom.info_exposes_officer = @lampiran_eleven_info_exposes_officer
    respond_to do |format|
      if @lampiran_eleven_other_symptom.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_comorbid_condition_path(@lampiran_eleven_close_contact_information), notice: 'Other symptom was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_other_symptom }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_other_symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/other_symptoms/1
  # PATCH/PUT /lampiran_eleven/other_symptoms/1.json
  def update
    respond_to do |format|
      if @lampiran_eleven_other_symptom.update(lampiran_eleven_other_symptom_params)
        format.html { redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_other_symptom_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer,@lampiran_eleven_other_symptom), notice: 'Other symptom was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_other_symptom }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_other_symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/other_symptoms/1
  # DELETE /lampiran_eleven/other_symptoms/1.json
  def destroy
    @lampiran_eleven_other_symptom.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_other_symptoms_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer), notice: 'Other symptom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_lampiran_eleven_other_symptom_url
      @lampiran_eleven_info_exposes_officer = LampiranEleven::InfoExposesOfficer.friendly.find(params[:info_exposes_officer_id])
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end

    def set_lampiran_eleven_other_symptom
      @lampiran_eleven_other_symptom = LampiranEleven::OtherSymptom.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_other_symptom_params
      params.require(:lampiran_eleven_other_symptom).permit(:is_shivering, :is_nausea, :is_convulsions, :is_fatigue, :is_headache, :is_joint_pain, :is_muscleache, :is_throw_up, :is_diarrhea, :is_rash, :is_conjuctivitis, :is_bloody_nose, :is_loss_of_consciousness, :is_loss_of_appetite, :is_neurologis, :tell_of_neurologis, :other_symptom)
    end
end
