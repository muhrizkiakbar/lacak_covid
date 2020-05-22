class LSix::ThirdsController < ApplicationController
  before_action :set_l_six_third, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_third_url
  # GET /l_six/thirds
  # GET /l_six/thirds.json
  def index
    @l_six_thirds = LSix::Third.all
    authorize @l_six_thirds
  end

  # GET /l_six/thirds/1
  # GET /l_six/thirds/1.json
  def show
  end

  # GET /l_six/thirds/new
  def new
    @l_six_third = LSix::Third.new
    authorize @l_six_third
  end

  # GET /l_six/thirds/1/edit
  def edit
    authorize @l_six_third
  end

  # POST /l_six/thirds
  # POST /l_six/thirds.json
  def create
    @l_six_third = LSix::Third.new(l_six_third_params)
    @l_six_third.ls_first = @l_six_first
    respond_to do |format|
      if @l_six_third.save
        if params[:l_six_third][:is_other]
        format.html { redirect_to new_l_six_first_second_third_t_checkother_path(@l_six_first, @l_six_second,@l_six_third), notice: 'Third was successfully created.' }
        else
          ###lanjut ke empat
        end
        format.json { render :show, status: :created, location: @l_six_third }
      else
        format.html { render :new }
        format.json { render json: @l_six_third.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/thirds/1
  # PATCH/PUT /l_six/thirds/1.json
  def update
    respond_to do |format|
      if @l_six_third.update(l_six_third_params)
        format.html { redirect_to l_six_firsts_path, notice: 'Third was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_third }
      else
        format.html { render :edit }
        format.json { render json: @l_six_third.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_six/thirds/1
  # DELETE /l_six/thirds/1.json
  def destroy
    authorize @l_six_third
    @l_six_third.destroy
    respond_to do |format|
      format.html { redirect_to l_six_firsts_path, notice: 'Third was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_third_url
      @l_six_first = LSix::First.friendly.find(params[:first_id])
      @l_six_second = LSix::Second.friendly.find(params[:second_id])
    end

    def set_l_six_third
      @l_six_third = LSix::Third.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_third_params
      params.require(:l_six_third).permit(:date_nasopharyngeal, :place_nasopharyngeal, :result_nasopharyngeal, :date_oropharyngeal, :place_oropharyngeal, :result_oropharyngeal, :date_sputum, :place_sputum, :result_sputum, :date_serum, :place_serum, :result_serum)
    end
end