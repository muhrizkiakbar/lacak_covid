class LampiranEleven::CloseContactInfoHomesController < ApplicationController
  before_action :set_lampiran_eleven_close_contact_info_home, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_close_contact_info_home_url
  # GET /lampiran_eleven/close_contact_info_homes
  # GET /lampiran_eleven/close_contact_info_homes.json
  def index
    @lampiran_eleven_close_contact_info_homes = LampiranEleven::CloseContactInfoHome.all
  end

  # GET /lampiran_eleven/close_contact_info_homes/1
  # GET /lampiran_eleven/close_contact_info_homes/1.json
  def show
  end

  # GET /lampiran_eleven/close_contact_info_homes/new
  def new
    @lampiran_eleven_close_contact_info_home = LampiranEleven::CloseContactInfoHome.new
    if @lampiran_eleven_information_expose.close_contact_info_home.nil?
      redirect_to lampiran_eleven_close_contact_information_information_expose_close_contact_info_home_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_information_expose,@lampiran_eleven_information_expose.close_contact_info_home), notice: 'Close contact info home has been filled, you only can edit.' 
    end
  end

  # GET /lampiran_eleven/close_contact_info_homes/1/edit
  def edit
  end

  # POST /lampiran_eleven/close_contact_info_homes
  # POST /lampiran_eleven/close_contact_info_homes.json
  def create
    @lampiran_eleven_close_contact_info_home = LampiranEleven::CloseContactInfoHome.new(lampiran_eleven_close_contact_info_home_params)
    @lampiran_eleven_close_contact_info_home.information_expose = @lampiran_eleven_information_expose
    respond_to do |format|
      if @lampiran_eleven_close_contact_info_home.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_information_expose_close_contact_info_home_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_information_expose), notice: 'Close contact info home was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_close_contact_info_home }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_close_contact_info_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/close_contact_info_homes/1
  # PATCH/PUT /lampiran_eleven/close_contact_info_homes/1.json
  def update
    respond_to do |format|
      if @lampiran_eleven_close_contact_info_home.update(lampiran_eleven_close_contact_info_home_params)
        format.html { redirect_to lampiran_eleven_close_contact_information_information_expose_close_contact_info_home_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_information_expose,@lampiran_eleven_close_contact_info_home), notice: 'Close contact info home was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_close_contact_info_home }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_close_contact_info_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/close_contact_info_homes/1
  # DELETE /lampiran_eleven/close_contact_info_homes/1.json
  def destroy
    @lampiran_eleven_close_contact_info_home.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_information_info_exposes_officers_path(@lampiran_eleven_close_contact_information,@lampiran_eleven_information_expose), notice: 'Close contact info home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_close_contact_info_home_url
      @lampiran_eleven_information_expose = LampiranEleven::InformationExpose.friendly.find(params[:information_expose_id])
      @lampiran_eleven_close_contact = @lampiran_eleven_information_expose.close_contact
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:close_contact_information_id])
    end
    def set_lampiran_eleven_close_contact_info_home
      @lampiran_eleven_close_contact_info_home = LampiranEleven::CloseContactInfoHome.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_close_contact_info_home_params
      params.require(:lampiran_eleven_close_contact_info_home).permit(:address_close_contact_primer, :last_date_close_contact_primer, :is_room_contact_or_activity, :is_share_food, :number_of_days_of_contact_activity, :is_treating_primary_case, :is_hugging_the_primary_case, :is_hugging_the_primary_case, :is_primary_case_shake, :is_drink_using_the_same_place, :is_use_the_same_toilet, :is_kiss_the_primary_case, :is_sleep_in_the_same_room, :is_eat_using_the_same_place, :is_using_the_same_equipment)
    end
end
