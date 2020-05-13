class LampiranEleven::CloseContactsController < ApplicationController
  before_action :set_lampiran_eleven_close_contact, only: [:show, :edit, :update, :destroy]

  # GET /lampiran_eleven/close_contacts
  # GET /lampiran_eleven/close_contacts.json
  def index
    @lampiran_eleven_close_contacts = LampiranEleven::CloseContact.all
  end

  # GET /lampiran_eleven/close_contacts/1
  # GET /lampiran_eleven/close_contacts/1.json
  def show
  end

  # GET /lampiran_eleven/close_contacts/new
  def new
    @lampiran_eleven_close_contact = LampiranEleven::CloseContact.new
  end

  # GET /lampiran_eleven/close_contacts/1/edit
  def edit
  end

  # POST /lampiran_eleven/close_contacts
  # POST /lampiran_eleven/close_contacts.json
  def create
    @lampiran_eleven_close_contact = LampiranEleven::CloseContact.new(lampiran_eleven_close_contact_params)

    respond_to do |format|
      if @lampiran_eleven_close_contact.save
        format.html { redirect_to @lampiran_eleven_close_contact, notice: 'Close contact was successfully created.' }
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
      if @lampiran_eleven_close_contact.update(lampiran_eleven_close_contact_params)
        format.html { redirect_to @lampiran_eleven_close_contact, notice: 'Close contact was successfully updated.' }
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
    @lampiran_eleven_close_contact.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contacts_url, notice: 'Close contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_close_contact
      @lampiran_eleven_close_contact = LampiranEleven::CloseContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_close_contact_params
      params.require(:lampiran_eleven_close_contact).permit(:lampiran_eleven_information_expose_id, :start_travel_qn_2_id, :end_travel_qn_2_id, :main_job_type_id, :main_transportation_id, :question_number_1, :date_question_number_1, :question_number_2, :date_question_number_2, :question_number_3, :date_question_number_3, :other_job_type, :address_job, :other_transportation)
    end
end
