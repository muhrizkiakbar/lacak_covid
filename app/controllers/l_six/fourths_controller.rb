class LSix::FourthsController < ApplicationController
  before_action :set_l_six_fourth, only: [:show, :edit, :update, :destroy]

  # GET /l_six/fourths
  # GET /l_six/fourths.json
  def index
    @l_six_fourths = LSix::Fourth.all
  end

  # GET /l_six/fourths/1
  # GET /l_six/fourths/1.json
  def show
  end

  # GET /l_six/fourths/new
  def new
    @l_six_fourth = LSix::Fourth.new
  end

  # GET /l_six/fourths/1/edit
  def edit
  end

  # POST /l_six/fourths
  # POST /l_six/fourths.json
  def create
    @l_six_fourth = LSix::Fourth.new(l_six_fourth_params)

    respond_to do |format|
      if @l_six_fourth.save
        format.html { redirect_to @l_six_fourth, notice: 'Fourth was successfully created.' }
        format.json { render :show, status: :created, location: @l_six_fourth }
      else
        format.html { render :new }
        format.json { render json: @l_six_fourth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/fourths/1
  # PATCH/PUT /l_six/fourths/1.json
  def update
    respond_to do |format|
      if @l_six_fourth.update(l_six_fourth_params)
        format.html { redirect_to @l_six_fourth, notice: 'Fourth was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_fourth }
      else
        format.html { render :edit }
        format.json { render json: @l_six_fourth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_six/fourths/1
  # DELETE /l_six/fourths/1.json
  def destroy
    @l_six_fourth.destroy
    respond_to do |format|
      format.html { redirect_to l_six_fourths_url, notice: 'Fourth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_fourth
      @l_six_fourth = LSix::Fourth.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_fourth_params
      params.require(:l_six_fourth).permit(:l_six_first_id, :abroad, :abroad_destination, :out_town, :out_town_destination, :hospital, :hospital_destination, :animal_market, :animal_market_destination, :contact_pdp, :contact_pdp_destination, :contact_positive, :contact_positive_destination, :medic_officer, :explain_of_procedure_alcohol, :is_goggle, :isn_apd, :is_n99_ffp3, :is_n95_ffp2, :is_gloves, :is_medic_mask, :is_gown, :is_procedure)
    end
end
