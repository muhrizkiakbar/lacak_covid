class Main::JobPositionsController < ApplicationController
  before_action :set_main_job_position, only: [:show, :edit, :update, :destroy]

  # GET /main/job_positions
  # GET /main/job_positions.json
  def index
    @main_job_positions = Main::JobPosition.all
    authorize @main_job_positions
  end

  # GET /main/job_positions/1
  # GET /main/job_positions/1.json
  def show
  end

  # GET /main/job_positions/new
  def new
    @main_job_position = Main::JobPosition.new
    authorize @main_job_position
    respond_to do |format|
      format.js
    end
  end

  # GET /main/job_positions/1/edit
  def edit
    authorize @main_job_position
    respond_to do |format|
      format.js
    end
  end

  # POST /main/job_positions
  # POST /main/job_positions.json
  def create
    @main_job_position = Main::JobPosition.new(main_job_position_params)

    respond_to do |format|
      if @main_job_position.save
        format.html { redirect_to main_job_positions_path, notice: 'Job position was successfully created.' }
        format.json { render :show, status: :created, location: @main_job_position }
      else
        format.html { render :new }
        format.json { render json: @main_job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/job_positions/1
  # PATCH/PUT /main/job_positions/1.json
  def update
    respond_to do |format|
      if @main_job_position.update(main_job_position_params)
        format.html { redirect_to main_job_positions_path, notice: 'Job position was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_job_position }
      else
        format.html { render :edit }
        format.json { render json: @main_job_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/job_positions/1
  # DELETE /main/job_positions/1.json
  def destroy
    authorize @main_job_position
    @main_job_position.destroy
    respond_to do |format|
      format.html { redirect_to main_job_positions_url, notice: 'Job position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_job_position
      @main_job_position = Main::JobPosition.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_job_position_params
      params.require(:main_job_position).permit(:job_position)
    end
end
