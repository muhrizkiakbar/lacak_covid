class LampiranEleven::CloseContactInformationsController < ApplicationController
  before_action :set_lampiran_eleven_close_contact_information, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_close_contact_information_params, only: [:create,:update]
  # GET /lampiran_eleven/close_contact_informations
  # GET /lampiran_eleven/close_contact_informations.json
  def index
    if !current_user.dinkes_province.nil?
      @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
      @lampiran_eleven_close_contact_informations = @search.result(distinct: true).page params[:page]
    elsif !current_user.dinkes_region.nil?
      user = User.pluck(:id).where('main_dinkes_region_id = ?', current_user.dinkes_region.id)
      @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: user).page params[:page]
    elsif !current_user.hospital.nil?
      user = User.pluck(:id).where('main_hospital_id = ?', current_user.hospital.id)
      @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: user).page params[:page]
    else
      user = User.where('main_public_health_center_id = ?', current_user.public_health_center.id).pluck(:id)
      @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: user).page params[:page]
    end
    
    authorize @lampiran_eleven_close_contact_informations
  end

  # GET /lampiran_eleven/close_contact_informations/1
  # GET /lampiran_eleven/close_contact_informations/1.json
  def show
  end

  # GET /lampiran_eleven/close_contact_informations/new
  def new
    @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.new
    authorize @lampiran_eleven_close_contact_information
  end

  # GET /lampiran_eleven/close_contact_informations/1/edit
  def edit
    authorize @lampiran_eleven_close_contact_information
  end

  # POST /lampiran_eleven/close_contact_informations
  # POST /lampiran_eleven/close_contact_informations.json
  def create
    @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.new(lampiran_eleven_close_contact_information_params)
    @lampiran_eleven_close_contact_information.patient = @main_patient
    @lampiran_eleven_close_contact_information.public_health_center = @main_public_health_center
    @lampiran_eleven_close_contact_information.user = @user
    respond_to do |format|
      if @lampiran_eleven_close_contact_information.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_information_expose_path @lampiran_eleven_close_contact_information, notice: 'Close contact information was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_close_contact_information }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_close_contact_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/close_contact_informations/1
  # PATCH/PUT /lampiran_eleven/close_contact_informations/1.json
  def update
    respond_to do |format|

    @lampiran_eleven_close_contact_information.patient = @main_patient
    @lampiran_eleven_close_contact_information.public_health_center = @main_public_health_center
    @lampiran_eleven_close_contact_information.user = @user
      if @lampiran_eleven_close_contact_information.update(lampiran_eleven_close_contact_information_params)
        format.html { redirect_to new_lampiran_eleven_close_contact_information_information_expose_path @lampiran_eleven_close_contact_information, notice: 'Close contact information was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_close_contact_information }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_close_contact_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/close_contact_informations/1
  # DELETE /lampiran_eleven/close_contact_informations/1.json
  def destroy
    authorize @lampiran_eleven_close_contact_information
    @lampiran_eleven_close_contact_information.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_informations_url, notice: 'Close contact information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_close_contact_information_params
      @main_patient = Main::Patient.friendly.find(params[:lampiran_eleven_close_contact_information][:main_patient_id])
      @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:lampiran_eleven_close_contact_information][:main_public_health_center_id])
      @user = User.first
    end

    def set_lampiran_eleven_close_contact_information
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_close_contact_information_params
      params.require(:lampiran_eleven_close_contact_information).permit(:fill_in_date, :contact_tracking_date, :contact_with_positive_case, :placement)
    end
end
