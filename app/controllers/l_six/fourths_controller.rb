class LSix::FourthsController < ApplicationController
  before_action :set_l_six_fourth, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_fourth_url
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
    @l_six_fourth.ls_first = @l_six_first
    respond_to do |format|
      if @l_six_fourth.save
        format.html { redirect_to l_six_first_second_third_fourth_path(@l_six_first,@l_six_second,@l_six_thirds,@l_six_fourth), notice: 'Fourth was successfully created.' }
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
        format.html { redirect_to l_six_first_second_third_fourth_path(@l_six_first,@l_six_second,@l_six_thirds,@l_six_fourth), notice: 'Fourth was successfully updated.' }
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
      format.html { redirect_to l_six_firsts_path, notice: 'Fourth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_fourth_url
      @l_six_first = LSix::First.friendly.find(params[:first_id])
      puts"=" *100
      puts @l_six_first.interview_date
      @l_six_second = LSix::Second.friendly.find(params[:second_id])
      @l_six_third = LSix::Third.friendly.find(params[:third_id])
    end

    def set_l_six_fourth
      @l_six_fourth = LSix::Fourth.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_fourth_params
      params.require(:l_six_fourth).permit(:abroad, :abroad_destination, :out_town, :out_town_destination, :hospital, :hospital_destination, :animal_market, :animal_market_destination, :contact_pdp, :contact_pdp_destination, :contact_positive, :contact_positive_destination, :medic_officer, :ispa_chronic, :explain_of_procedure_alcohol, :is_goggle, :isn_apd, :is_n99_ffp3, :is_n95_ffp2, :is_gloves, :is_medic_mask, :is_gown, :is_procedure)
    end
end
