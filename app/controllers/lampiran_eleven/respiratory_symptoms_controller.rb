class LampiranEleven::RespiratorySymptomsController < ApplicationController
  before_action :set_lampiran_eleven_respiratory_symptom, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_respiratory_symptom_url
  # GET /lampiran_eleven/respiratory_symptoms
  # GET /lampiran_eleven/respiratory_symptoms.json
  def index
    @lampiran_eleven_respiratory_symptoms = LampiranEleven::RespiratorySymptom.all
  end

  # GET /lampiran_eleven/respiratory_symptoms/1
  # GET /lampiran_eleven/respiratory_symptoms/1.json
  def show
  end

  # GET /lampiran_eleven/respiratory_symptoms/new
  def new
    @lampiran_eleven_respiratory_symptom = LampiranEleven::RespiratorySymptom.new
    if !@lampiran_eleven_info_exposes_officer.respiratory_symptom.nil?
      redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_respiratory_symptom_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer,@lampiran_eleven_info_exposes_officer.respiratory_symptom), notice: 'Respiratory symptom has been filled, you only can edit.' }
    end
  end

  # GET /lampiran_eleven/respiratory_symptoms/1/edit
  def edit
  end

  # POST /lampiran_eleven/respiratory_symptoms
  # POST /lampiran_eleven/respiratory_symptoms.json
  def create
    @lampiran_eleven_respiratory_symptom = LampiranEleven::RespiratorySymptom.new(lampiran_eleven_respiratory_symptom_params)
    @lampiran_eleven_respiratory_symptom.info_exposes_officer = @lampiran_eleven_info_exposes_officer
    respond_to do |format|
      if @lampiran_eleven_respiratory_symptom.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_info_exposes_officer_other_symptom_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer), notice: 'Respiratory symptom was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_respiratory_symptom }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_respiratory_symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/respiratory_symptoms/1
  # PATCH/PUT /lampiran_eleven/respiratory_symptoms/1.json
  def update
    respond_to do |format|
      if @lampiran_eleven_respiratory_symptom.update(lampiran_eleven_respiratory_symptom_params)
        format.html { redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_respiratory_symptom_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer,@lampiran_eleven_respiratory_symptom), notice: 'Respiratory symptom was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_respiratory_symptom }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_respiratory_symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/respiratory_symptoms/1
  # DELETE /lampiran_eleven/respiratory_symptoms/1.json
  def destroy
    @lampiran_eleven_respiratory_symptom.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_info_exposes_officer_respiratory_symptoms_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_info_exposes_officer), notice: 'Respiratory symptom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_lampiran_eleven_respiratory_symptom_url
      @lampiran_eleven_info_exposes_officer = LampiranEleven::InfoExposesOfficer.friendly.find(params[:info_exposes_officer_id])
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end

    def set_lampiran_eleven_respiratory_symptom
      @lampiran_eleven_respiratory_symptom = LampiranEleven::RespiratorySymptom.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_respiratory_symptom_params
      params.require(:lampiran_eleven_respiratory_symptom).permit(:is_sore_throat, :date_of_sore_throat, :is_cough, :date_of_cough, :is_flu, :date_of_flu, :is_out_of_breath, :date_of_out_of_breath)
    end
end
