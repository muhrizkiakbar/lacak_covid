class Main::TypeContactsController < ApplicationController
  before_action :set_main_type_contact, only: [:show, :edit, :update, :destroy]

  # GET /main/type_contacts
  # GET /main/type_contacts.json
  def index
    @main_type_contacts = Main::TypeContact.all.page params[:page]
    authorize @main_type_contacts
  end

  # GET /main/type_contacts/1
  # GET /main/type_contacts/1.json
  def show
  end

  # GET /main/type_contacts/new
  def new
    @main_type_contact = Main::TypeContact.new
    authorize @main_type_contact
    respond_to do |format|
      format.js
    end
  end

  # GET /main/type_contacts/1/edit
  def edit
    authorize @main_type_contact
    respond_to do |format|
      format.js
    end
  end

  # POST /main/type_contacts
  # POST /main/type_contacts.json
  def create
    @main_type_contact = Main::TypeContact.new(main_type_contact_params)

    respond_to do |format|
      if @main_type_contact.save
        format.html { redirect_to main_type_contacts_path, notice: 'Type contact was successfully created.' }
        format.json { render :show, status: :created, location: @main_type_contact }
      else
        # format.html { render :new }
        format.js { render "errors" }
        format.json { render json: @main_type_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/type_contacts/1
  # PATCH/PUT /main/type_contacts/1.json
  def update
    respond_to do |format|
      if @main_type_contact.update(main_type_contact_params)
        format.html { redirect_to main_type_contacts_path, notice: 'Type contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_type_contact }
      else
        # format.html { render :edit }
        format.js { render "errors" }
        format.json { render json: @main_type_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/type_contacts/1
  # DELETE /main/type_contacts/1.json
  def destroy
    authorize @main_type_contact
    @main_type_contact.destroy
    respond_to do |format|
      format.html { redirect_to main_type_contacts_path, notice: 'Type contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_type_contact
      @main_type_contact = Main::TypeContact.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_type_contact_params
      params.require(:main_type_contact).permit(:type_contact)
    end
end
