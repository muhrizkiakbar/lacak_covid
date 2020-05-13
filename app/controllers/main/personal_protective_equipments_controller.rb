class Main::PersonalProtectiveEquipmentsController < ApplicationController
  before_action :set_main_personal_protective_equipment, only: [:show, :edit, :update, :destroy]

  # GET /main/personal_protective_equipments
  # GET /main/personal_protective_equipments.json
  def index
    @main_personal_protective_equipments = Main::PersonalProtectiveEquipment.all
  end

  # GET /main/personal_protective_equipments/1
  # GET /main/personal_protective_equipments/1.json
  def show
  end

  # GET /main/personal_protective_equipments/new
  def new
    @main_personal_protective_equipment = Main::PersonalProtectiveEquipment.new
  end

  # GET /main/personal_protective_equipments/1/edit
  def edit
  end

  # POST /main/personal_protective_equipments
  # POST /main/personal_protective_equipments.json
  def create
    @main_personal_protective_equipment = Main::PersonalProtectiveEquipment.new(main_personal_protective_equipment_params)

    respond_to do |format|
      if @main_personal_protective_equipment.save
        format.html { redirect_to main_personal_protective_equipments_path, notice: 'Personal protective equipment was successfully created.' }
        format.json { render :show, status: :created, location: @main_personal_protective_equipment }
      else
        format.html { render :new }
        format.json { render json: @main_personal_protective_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/personal_protective_equipments/1
  # PATCH/PUT /main/personal_protective_equipments/1.json
  def update
    respond_to do |format|
      if @main_personal_protective_equipment.update(main_personal_protective_equipment_params)
        format.html { redirect_to main_personal_protective_equipments_path, notice: 'Personal protective equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_personal_protective_equipment }
      else
        format.html { render :edit }
        format.json { render json: @main_personal_protective_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/personal_protective_equipments/1
  # DELETE /main/personal_protective_equipments/1.json
  def destroy
    @main_personal_protective_equipment.destroy
    respond_to do |format|
      format.html { redirect_to main_personal_protective_equipments_path, notice: 'Personal protective equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_personal_protective_equipment
      @main_personal_protective_equipment = Main::PersonalProtectiveEquipment.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_personal_protective_equipment_params
      params.require(:main_personal_protective_equipment).permit(:personal_protective_equipment)
    end
end
