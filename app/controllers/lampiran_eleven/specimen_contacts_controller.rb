class LampiranEleven::SpecimenContactsController < ApplicationController
  before_action :set_lampiran_eleven_specimen_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_specimen_contact_url
  # GET /lampiran_eleven/specimen_contacts
  # GET /lampiran_eleven/specimen_contacts.json
  def index
    @lampiran_eleven_specimen_contacts = LampiranEleven::SpecimenContact.all
  end

  # GET /lampiran_eleven/specimen_contacts/1
  # GET /lampiran_eleven/specimen_contacts/1.json
  def show
  end

  # GET /lampiran_eleven/specimen_contacts/new
  def new
    @lampiran_eleven_specimen_contact = LampiranEleven::SpecimenContact.new
    # if !@lampiran_eleven_close_contact_information.specimen_contact.nil?
    #   redirect_to lampiran_eleven_close_contact_information_specimen_contact_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_close_contact_information.specimen_contact), notice: 'Specimen status symptom has been filled, you only can edit.' 
    # end
  end

  # GET /lampiran_eleven/specimen_contacts/1/edit
  def edit
  end

  # POST /lampiran_eleven/specimen_contacts
  # POST /lampiran_eleven/specimen_contacts.json
  def create
    @lampiran_eleven_specimen_contact = LampiranEleven::SpecimenContact.new(lampiran_eleven_specimen_contact_params)
    @lampiran_eleven_specimen_contact.close_contact_information = @lampiran_eleven_close_contact_information
    respond_to do |format|
      if @lampiran_eleven_specimen_contact.save
        format.html { redirect_to lampiran_eleven_close_contact_information_specimen_contact_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_specimen_contact), notice: 'Specimen contact was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_specimen_contact }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_specimen_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/specimen_contacts/1
  # PATCH/PUT /lampiran_eleven/specimen_contacts/1.json
  def update
    respond_to do |format|
      if @lampiran_eleven_specimen_contact.update(lampiran_eleven_specimen_contact_params)
        format.html { redirect_to lampiran_eleven_close_contact_information_specimen_contact_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_specimen_contact), notice: 'Specimen contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_specimen_contact }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_specimen_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/specimen_contacts/1
  # DELETE /lampiran_eleven/specimen_contacts/1.json
  def destroy
    @lampiran_eleven_specimen_contact.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_specimen_contacts_path(@lampiran_eleven_close_contact_information), notice: 'Specimen contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_specimen_contact_url
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end
    def set_lampiran_eleven_specimen_contact
      @lampiran_eleven_specimen_contact = LampiranEleven::SpecimenContact.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_specimen_contact_params
      params.require(:lampiran_eleven_specimen_contact).permit(:type_of_specimen, :date_of_specimen_collection, :laboratory_examination_results)
    end
end
