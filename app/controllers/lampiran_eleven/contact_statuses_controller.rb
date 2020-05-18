class LampiranEleven::ContactStatusesController < ApplicationController
  before_action :set_lampiran_eleven_contact_status, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_contact_status_url
  # GET /lampiran_eleven/contact_statuses
  # GET /lampiran_eleven/contact_statuses.json
  def index
    @lampiran_eleven_contact_statuses = LampiranEleven::ContactStatus.all
  end

  # GET /lampiran_eleven/contact_statuses/1
  # GET /lampiran_eleven/contact_statuses/1.json
  def show
  end

  # GET /lampiran_eleven/contact_statuses/new
  def new
    @lampiran_eleven_contact_status = LampiranEleven::ContactStatus.new
    # if !@lampiran_eleven_close_contact_information.contact_status.nil?
    #   redirect_to lampiran_eleven_close_contact_information_contact_status_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_close_contact_information.contact_status), notice: 'Contact status symptom has been filled, you only can edit.' 
    # end
  end

  # GET /lampiran_eleven/contact_statuses/1/edit
  def edit
  end

  # POST /lampiran_eleven/contact_statuses
  # POST /lampiran_eleven/contact_statuses.json
  def create
    @lampiran_eleven_contact_status = LampiranEleven::ContactStatus.new(lampiran_eleven_contact_status_params)
    @lampiran_eleven_contact_status.close_contact_information = @lampiran_eleven_close_contact_information
    respond_to do |format|
      if @lampiran_eleven_contact_status.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_specimen_contact_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_contact_status), notice: 'Contact status was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_contact_status }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_contact_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/contact_statuses/1
  # PATCH/PUT /lampiran_eleven/contact_statuses/1.json
  def update
    respond_to do |format|
      if @lampiran_eleven_contact_status.update(lampiran_eleven_contact_status_params)
        format.html { redirect_to @lampiran_eleven_close_contact_information, notice: 'Contact status was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_contact_status }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_contact_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/contact_statuses/1
  # DELETE /lampiran_eleven/contact_statuses/1.json
  def destroy
    @lampiran_eleven_contact_status.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_contact_statuses_path(@lampiran_eleven_close_contact_information), notice: 'Contact status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_contact_status_url
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end
    def set_lampiran_eleven_contact_status
      @lampiran_eleven_contact_status = LampiranEleven::ContactStatus.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_contact_status_params
      params.require(:lampiran_eleven_contact_status).permit( :status_patient, :date_of_status_recovered, :date_of_status_died, :is_been_treated, :start_date_of_treated, :end_date_of_treated, :is_dead_with_autopsy, :result_of_autopsy)
    end
end
