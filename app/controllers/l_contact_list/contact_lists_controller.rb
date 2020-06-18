class LContactList::ContactListsController < ApplicationController
  before_action :set_l_contact_list_contact_list, only: [:show, :edit, :update, :destroy]
  before_action :set_l_contact_list_contact_list_url, only: [:new, :create, :edit, :update]
  # GET /l_contact_list/contact_lists
  # GET /l_contact_list/contact_lists.json
  def index
    @l_contact_list_contact_lists = LContactList::ContactList.all
    authorize @l_contact_list_contact_lists
  end

  # GET /l_contact_list/contact_lists/1
  # GET /l_contact_list/contact_lists/1.json
  def show
    # authorize @l_contact_list_contact_list
  end

  # GET /l_contact_list/contact_lists/new
  def new
    @l_contact_list_contact_list = LContactList::ContactList.new
    respond_to do |format|
      format.js
    end
    # authorize @l_contact_list_contact_list
  end

  # GET /l_contact_list/contact_lists/1/edit
  def edit
    respond_to do |format|
      format.js
    end
    # authorize @l_contact_list_contact_list
  end

  # POST /l_contact_list/contact_lists
  # POST /l_contact_list/contact_lists.json
  def create
    @l_contact_list_contact_list = LContactList::ContactList.new(l_contact_list_contact_list_params)
    @l_contact_list_contact_list.patient = @main_patient
    respond_to do |format|
      if @l_contact_list_contact_list.save
        format.html { redirect_to main_patient_contact_patients_path(@main_patient, @l_contact_list_contact_list), notice: 'Contact list was successfully created.' }
        format.json { render :show, status: :created, location: @l_contact_list_contact_list }
      else
        format.html { render :new }
        format.json { render json: @l_contact_list_contact_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_contact_list/contact_lists/1
  # PATCH/PUT /l_contact_list/contact_lists/1.json
  def update
    respond_to do |format|
      if @l_contact_list_contact_list.update(l_contact_list_contact_list_params)
        format.html { redirect_to l_contact_list_contact_list_path(@l_contact_list_contact_list), notice: 'Contact list was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_contact_list_contact_list }
      else
        format.html { render :edit }
        format.json { render json: @l_contact_list_contact_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_contact_list/contact_lists/1
  # DELETE /l_contact_list/contact_lists/1.json
  def destroy
    authorize @l_contact_list_contact_list
    @l_contact_list_contact_list.destroy
    respond_to do |format|
      format.html { redirect_to l_contact_list_contact_lists_url, notice: 'Contact list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_contact_list_contact_list
      @l_contact_list_contact_list = LContactList::ContactList.friendly.find(params[:id])
    end

    def set_l_contact_list_contact_list_url
      @main_patient = Main::Patient.friendly.find(params[:patient_id])
    end

    # Only allow a list of trusted parameters through.
    def l_contact_list_contact_list_params
      params.require(:l_contact_list_contact_list).permit(:date_contact)
    end
end
