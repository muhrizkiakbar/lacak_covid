class LampiranEleven::InformationExposesController < ApplicationController
  before_action :set_lampiran_eleven_information_expose, only: [:show, :edit, :update, :destroy]

  # GET /lampiran_eleven/information_exposes
  # GET /lampiran_eleven/information_exposes.json
  def index
    @lampiran_eleven_information_exposes = LampiranEleven::InformationExpose.all
  end

  # GET /lampiran_eleven/information_exposes/1
  # GET /lampiran_eleven/information_exposes/1.json
  def show
  end

  # GET /lampiran_eleven/information_exposes/new
  def new
    @lampiran_eleven_information_expose = LampiranEleven::InformationExpose.new
  end

  # GET /lampiran_eleven/information_exposes/1/edit
  def edit
  end

  # POST /lampiran_eleven/information_exposes
  # POST /lampiran_eleven/information_exposes.json
  def create
    @lampiran_eleven_information_expose = LampiranEleven::InformationExpose.new(lampiran_eleven_information_expose_params)

    respond_to do |format|
      if @lampiran_eleven_information_expose.save
        format.html { redirect_to @lampiran_eleven_information_expose, notice: 'Information expose was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_information_expose }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_information_expose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/information_exposes/1
  # PATCH/PUT /lampiran_eleven/information_exposes/1.json
  def update
    respond_to do |format|
      if @lampiran_eleven_information_expose.update(lampiran_eleven_information_expose_params)
        format.html { redirect_to @lampiran_eleven_information_expose, notice: 'Information expose was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_information_expose }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_information_expose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/information_exposes/1
  # DELETE /lampiran_eleven/information_exposes/1.json
  def destroy
    @lampiran_eleven_information_expose.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_information_exposes_url, notice: 'Information expose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_information_expose
      @lampiran_eleven_information_expose = LampiranEleven::InformationExpose.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_information_expose_params
      params.require(:lampiran_eleven_information_expose).permit(:lampiran_eleven_close_contact_information_id, :main_type_contact_id, :main_set_location_id, :other_type_contact, :date_contact, :duration_contact, :other_set_location)
    end
end
