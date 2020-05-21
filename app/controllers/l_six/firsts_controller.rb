class LSix::FirstsController < ApplicationController
  before_action :set_l_six_first, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_first_request, only: [:create,:update]
  # GET /l_six/firsts
  # GET /l_six/firsts.json
  def index
    @l_six_firsts = LSix::First.all
    authorize @l_six_firsts
  end

  # GET /l_six/firsts/1
  # GET /l_six/firsts/1.json
  def show
  end

  # GET /l_six/firsts/new
  def new
    @l_six_first = LSix::First.new
    authorize @l_six_first
  end

  # GET /l_six/firsts/1/edit
  def edit
    authorize @l_six_first
  end

  # POST /l_six/firsts
  # POST /l_six/firsts.json
  def create
    @l_six_first = LSix::First.new(l_six_first_params)
    @l_six_first.user = current_user
    @l_six_first.patient = @main_patient
    respond_to do |format|
      if @l_six_first.save
        format.html { redirect_to new_l_six_first_second_path(@l_six_first), notice: 'First was successfully created.' }
        format.json { render :show, status: :created, location: @l_six_first }
      else
        format.html { render :new }
        format.json { render json: @l_six_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/firsts/1
  # PATCH/PUT /l_six/firsts/1.json
  def update
    respond_to do |format|
      @l_six_first.patient = @main_patient
      if @l_six_first.update(l_six_first_params)
        format.html { redirect_to l_six_firsts_path, notice: 'First was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_first }
      else
        format.html { render :edit }
        format.json { render json: @l_six_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_six/firsts/1
  # DELETE /l_six/firsts/1.json
  def destroy
    authorize @l_six_first
    @l_six_first.destroy
    respond_to do |format|
      format.html { redirect_to l_six_firsts_path, notice: 'First was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_first
      @l_six_first = LSix::First.find(params[:id])
    end

    def set_l_six_first_request
      @main_patient = Main::Patient.friendly.find(params[:patient_id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_first_params
      params.require(:l_six_first).permit(:interview_date, :job)
    end
end
