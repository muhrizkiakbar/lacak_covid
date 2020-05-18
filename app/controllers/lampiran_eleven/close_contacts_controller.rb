class LampiranEleven::CloseContactsController < ApplicationController
  before_action :set_lampiran_eleven_close_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_close_contact_url
  before_action :set_lampiran_eleven_close_contact_params, only: [:create, :update]
  # GET /lampiran_eleven/close_contacts
  # GET /lampiran_eleven/close_contacts.json
  def index
    @lampiran_eleven_close_contacts = LampiranEleven::CloseContact.all
    authorize @lampiran_eleven_close_contacts
  end

  # GET /lampiran_eleven/close_contacts/1
  # GET /lampiran_eleven/close_contacts/1.json
  def show
  end

  # GET /lampiran_eleven/close_contacts/new
  def new
    @lampiran_eleven_close_contact = LampiranEleven::CloseContact.new
    authorize @lampiran_eleven_close_contact
    # if !@lampiran_eleven_information_expose.close_contact.nil?
    #   redirect_to lampiran_eleven_close_contact_information_information_expose_close_contact_path(
    #     @lampiran_eleven_close_contact_information,
    #     @lampiran_eleven_information_expose,
    #     @lampiran_eleven_information_expose.close_contact), notice: 'Close contact has been filled, you only can edit.' 
    # end
  end

  # GET /lampiran_eleven/close_contacts/1/edit
  def edit
    authorize @lampiran_eleven_close_contact
  end

  # POST /lampiran_eleven/close_contacts
  # POST /lampiran_eleven/close_contacts.json
  def create
    @lampiran_eleven_close_contact = LampiranEleven::CloseContact.new(lampiran_eleven_close_contact_params)
    @lampiran_eleven_close_contact.information_expose = @lampiran_eleven_information_expose
    @lampiran_eleven_close_contact.start_travel_qn_2 = @start_travel_qn_2
    @lampiran_eleven_close_contact.end_travel_qn_2 = @end_travel_qn_2
    @lampiran_eleven_close_contact.job_type = @main_job_type
    @lampiran_eleven_close_contact.transportation = @main_transportation
    respond_to do |format|
      if @lampiran_eleven_close_contact.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_information_expose_close_contact_info_home_path(
          @lampiran_eleven_close_contact_information,
          @lampiran_eleven_information_expose), notice: 'Close contact was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_close_contact }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_close_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/close_contacts/1
  # PATCH/PUT /lampiran_eleven/close_contacts/1.json
  def update
    respond_to do |format|
      @lampiran_eleven_close_contact.start_travel_qn_2 = @start_travel_qn_2
      @lampiran_eleven_close_contact.end_travel_qn_2 = @end_travel_qn_2
      @lampiran_eleven_close_contact.job_type = @main_job_type
      @lampiran_eleven_close_contact.transportation = @main_transportation
      if @lampiran_eleven_close_contact.update(lampiran_eleven_close_contact_params)
        format.html { redirect_to @lampiran_eleven_close_contact_information, notice: 'Close contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_close_contact }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_close_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/close_contacts/1
  # DELETE /lampiran_eleven/close_contacts/1.json
  def destroy
    authorize @lampiran_eleven_close_contact
    @lampiran_eleven_close_contact.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_information_exposes_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_information_expose), notice: 'Close contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_close_contact_params
      if (params[:lampiran_eleven_close_contact][:start_travel_qn_2_id].nil?) || (params[:lampiran_eleven_close_contact][:start_travel_qn_2_id] == "")
        @start_travel_qn_2 = nil
      else
        @start_travel_qn_2 = Main::City.friendly.find(params[:lampiran_eleven_close_contact][:start_travel_qn_2_id])
      end
      if (params[:lampiran_eleven_close_contact][:end_travel_qn_2_id].nil?) || (params[:lampiran_eleven_close_contact][:end_travel_qn_2_id] == "")
        @end_travel_qn_2 = nil
      else
        @end_travel_qn_2 = Main::City.friendly.find(params[:lampiran_eleven_close_contact][:end_travel_qn_2_id])
      end

      if (params[:lampiran_eleven_close_contact][:main_job_type_id].nil?) || (params[:lampiran_eleven_close_contact][:main_job_type_id] == "")
        @main_job_type = nil
      else
        @main_job_type = Main::JobType.friendly.find(params[:lampiran_eleven_close_contact][:main_job_type_id])
      end

      if (params[:lampiran_eleven_close_contact][:main_transportation_id].nil? ) || (params[:lampiran_eleven_close_contact][:main_transportation_id] == "")
        @main_transportation = nil
      else
        @main_transportation = Main::Transportation.friendly.find(params[:lampiran_eleven_close_contact][:main_transportation_id])
      end

    end

    def set_lampiran_eleven_close_contact_url
      @lampiran_eleven_information_expose = LampiranEleven::InformationExpose.friendly.find(params[:information_expose_id])
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end

    def set_lampiran_eleven_close_contact
      @lampiran_eleven_close_contact = LampiranEleven::CloseContact.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_close_contact_params
      params.require(:lampiran_eleven_close_contact).permit( :question_number_1,:answer_qn_1, :date_question_number_1, :question_number_2, :date_question_number_2, :question_number_3, :date_question_number_3, :other_job_type, :address_job, :other_transportation)
    end
end
