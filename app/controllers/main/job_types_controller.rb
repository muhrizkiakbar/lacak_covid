class Main::JobTypesController < ApplicationController
  before_action :set_main_job_type, only: [:show, :edit, :update, :destroy]

  # GET /main/job_types
  # GET /main/job_types.json
  def index
    @main_job_types = Main::JobType.all
  end

  # GET /main/job_types/1
  # GET /main/job_types/1.json
  def show
  end

  # GET /main/job_types/new
  def new
    @main_job_type = Main::JobType.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/job_types/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/job_types
  # POST /main/job_types.json
  def create
    @main_job_type = Main::JobType.new(main_job_type_params)

    respond_to do |format|
      if @main_job_type.save
        format.html { redirect_to main_job_types_path, notice: 'Job type was successfully created.' }
        format.json { render :show, status: :created, location: @main_job_type }
      else
        format.js { render "errors" }
        format.html { render :new }
        format.json { render json: @main_job_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/job_types/1
  # PATCH/PUT /main/job_types/1.json
  def update
    respond_to do |format|
      if @main_job_type.update(main_job_type_params)
        format.html { redirect_to main_job_types_path, notice: 'Job type was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_job_type }
      else
        format.html { render :edit }
        format.js { render "errors" }
        format.json { render json: @main_job_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/job_types/1
  # DELETE /main/job_types/1.json
  def destroy
    @main_job_type.destroy
    respond_to do |format|
      format.html { redirect_to main_job_types_path, notice: 'Job type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_job_type
      @main_job_type = Main::JobType.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_job_type_params
      params.require(:main_job_type).permit(:job_type)
    end
end
