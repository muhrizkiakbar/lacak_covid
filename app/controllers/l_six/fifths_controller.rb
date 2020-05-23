class LSix::FifthsController < ApplicationController
  before_action :set_l_six_fifth, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_fifth_url
  # GET /l_six/fifths
  # GET /l_six/fifths.json
  def index
    @l_six_fifths = LSix::Fifth.all
  end

  # GET /l_six/fifths/1
  # GET /l_six/fifths/1.json
  def show
  end

  # GET /l_six/fifths/new
  def new
    @l_six_fifth = LSix::Fifth.new
  end

  # GET /l_six/fifths/1/edit
  def edit
  end

  # POST /l_six/fifths
  # POST /l_six/fifths.json
  def create
    @l_six_fifth = LSix::Fifth.new(l_six_fifth_params)
    @l_six_fifth.ls_first = @l_six_first
    respond_to do |format|
      if @l_six_fifth.save
        format.html { redirect_to l_six_first_path(@l_six_first), notice: 'Fifth was successfully created.' }
        format.json { render :show, status: :created, location: @l_six_fifth }
      else
        format.html { render :new }
        format.json { render json: @l_six_fifth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/fifths/1
  # PATCH/PUT /l_six/fifths/1.json
  def update
    respond_to do |format|
      if @l_six_fifth.update(l_six_fifth_params)
        format.html { redirect_to l_six_first_path(@l_six_first), notice: 'Fifth was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_fifth }
      else
        format.html { render :edit }
        format.json { render json: @l_six_fifth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_six/fifths/1
  # DELETE /l_six/fifths/1.json
  def destroy
    @l_six_fifth.destroy
    respond_to do |format|
      format.html { redirect_to l_six_first_path(@l_six_first), notice: 'Fifth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_fifth_url

      @l_six_first = LSix::First.friendly.find(params[:first_id])
      @l_six_second = LSix::Second.friendly.find(params[:second_id])
      @l_six_third = LSix::Third.friendly.find(params[:third_id])
      @l_six_fourth = LSix::Fourth.friendly.find(params[:fourth_id])
    end
    def set_l_six_fifth
      @l_six_fifth = LSix::Fifth.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_fifth_params
      params.require(:l_six_fifth).permit(:l_six_first_id, :name, :date_of_birth, :gender, :relation, :address, :phone_number, :activity)
    end
end
