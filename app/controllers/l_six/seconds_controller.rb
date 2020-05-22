class LSix::SecondsController < ApplicationController
  before_action :set_l_six_second, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_second_url
  before_action :set_l_six_second_request, only: [:create, :update]
  # GET /l_six/seconds
  # GET /l_six/seconds.json
  def index
    @l_six_seconds = LSix::Second.all
    authorize @l_six_seconds
  end

  # GET /l_six/seconds/1
  # GET /l_six/seconds/1.json
  def show
  end

  # GET /l_six/seconds/new
  def new
    @l_six_second = LSix::Second.new
    authorize @l_six_second
  end

  # GET /l_six/seconds/1/edit
  def edit
    authorize @l_six_second
  end

  # POST /l_six/seconds
  # POST /l_six/seconds.json
  def create
    @l_six_second = LSix::Second.new(l_six_second_params)
    @l_six_second.ls_first = @l_six_first
    @l_six_second.hospital = @main_hospital
    respond_to do |format|
      if @l_six_second.save
        format.html { redirect_to new_l_six_first_second_third_path(@l_six_first,@l_six_second), notice: 'Second was successfully created.' }
        format.json { render :show, status: :created, location: @l_six_second }
      else
        format.html { render :new }
        format.json { render json: @l_six_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/seconds/1
  # PATCH/PUT /l_six/seconds/1.json
  def update
    respond_to do |format|
      if @l_six_second.update(l_six_second_params)
        format.html { redirect_to l_six_firsts_path, notice: 'Second was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_second }
      else
        format.html { render :edit }
        format.json { render json: @l_six_second.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_six/seconds/1
  # DELETE /l_six/seconds/1.json
  def destroy
    authorize @l_six_second
    @l_six_second.destroy
    respond_to do |format|
      format.html { redirect_to l_six_firsts_path, notice: 'Second was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_second_url
      @l_six_first = LSix::First.friendly.find(params[:first_id])
      @user = current_user
    end

    def set_l_six_second_request
      params[:l_six_second][:main_hospital_id].nil? ? @main_hospital= nil : @main_hospital = Main::Hospital.friendly.find(params[:l_six_second][:main_hospital_id])
      
    end

    def set_l_six_second
      @l_six_second = LSix::Second.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_second_params
      params.require(:l_six_second).permit(:since_date_symptom, :fever_temperature, :out_of_breath, :history_fever, :cough, :cold, :sore_throat, :headache, :weak, :muscle_ache, :nausea_vomitting, :abdominal_pain, :diarrhea, :other_symptom, :is_pregnant, :is_diabetes, :is_heart_disease, :is_hypertention, :is_malignancy, :is_kidney_disease, :is_liver_disease, :is_immune_disease, :is_ppok, :other_condition, :is_being_treated_hospital, :last_date_hospital, :room_treated, :is_treated_icu, :is_intubation, :is_emco, :last_hospital, :last_status_patient, :date_of_die, :pneumonia, :ardc, :other_diagnose, :have_etiologi, :explain_etiologi)
    end
end
