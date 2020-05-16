class LampiranEleven::ComorbidConditionsController < ApplicationController
  before_action :set_lampiran_eleven_comorbid_condition, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_comorbid_condition_url
  # GET /lampiran_eleven/comorbid_conditions
  # GET /lampiran_eleven/comorbid_conditions.json
  def index
    @lampiran_eleven_comorbid_conditions = LampiranEleven::ComorbidCondition.all
  end

  # GET /lampiran_eleven/comorbid_conditions/1
  # GET /lampiran_eleven/comorbid_conditions/1.json
  def show
  end

  # GET /lampiran_eleven/comorbid_conditions/new
  def new
    @lampiran_eleven_comorbid_condition = LampiranEleven::ComorbidCondition.new
    # if !@lampiran_eleven_close_contact_information.comorbid_condition.nil?
    #   redirect_to lampiran_eleven_close_contact_information_comorbid_condition_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_close_contact_information.comorbid_condition), notice: 'Comorbid condition symptom has been filled, you only can edit.' 
    # end
  end

  # GET /lampiran_eleven/comorbid_conditions/1/edit
  def edit
  end

  # POST /lampiran_eleven/comorbid_conditions
  # POST /lampiran_eleven/comorbid_conditions.json
  def create
    @lampiran_eleven_comorbid_condition = LampiranEleven::ComorbidCondition.new(lampiran_eleven_comorbid_condition_params)
    @lampiran_eleven_comorbid_condition.close_contact_information = @lampiran_eleven_close_contact_information
    respond_to do |format|
      if @lampiran_eleven_comorbid_condition.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_contact_status_path(@lampiran_eleven_close_contact_information), notice: 'Comorbid condition was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_comorbid_condition }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_comorbid_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/comorbid_conditions/1
  # PATCH/PUT /lampiran_eleven/comorbid_conditions/1.json
  def update
    respond_to do |format|
      if @lampiran_eleven_comorbid_condition.update(lampiran_eleven_comorbid_condition_params)
        format.html { redirect_to lampiran_eleven_close_contact_information_comorbid_condition_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_comorbid_condition), notice: 'Comorbid condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_comorbid_condition }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_comorbid_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/comorbid_conditions/1
  # DELETE /lampiran_eleven/comorbid_conditions/1.json
  def destroy
    @lampiran_eleven_comorbid_condition.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_comorbid_conditions_path(@lampiran_eleven_close_contact_information), notice: 'Comorbid condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_comorbid_condition_url
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end
    def set_lampiran_eleven_comorbid_condition
      @lampiran_eleven_comorbid_condition = LampiranEleven::ComorbidCondition.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_comorbid_condition_params
      params.require(:lampiran_eleven_comorbid_condition).permit(:is_cancer, :is_diabetes, :is_ppok, :is_hiv, :is_liver, :is_obesity, :is_asthma, :is_blood_disorder, :is_heart_disease, :is_kidney, :is_neurology, :is_organ_donor_recipient, :is_pregnant, :is_first_semester_pregnant, :is_second_semester_pregnant, :is_third_semester_pregnant, :estimated_birth, :is_influenza_vaccine, :date_of_influenza_vaccine, :influenza_vaccine_in_the_country, :is_pvc_vaccine, :date_of_pvc_vaccine)
    end
end
