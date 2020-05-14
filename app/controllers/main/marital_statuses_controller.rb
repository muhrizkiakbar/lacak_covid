class Main::MaritalStatusesController < ApplicationController
  before_action :set_main_marital_status, only: [:show, :edit, :update, :destroy]

  # GET /main/marital_statuses
  # GET /main/marital_statuses.json
  def index
    @main_marital_statuses = Main::MaritalStatus.all
  end

  # GET /main/marital_statuses/1
  # GET /main/marital_statuses/1.json
  def show
  end

  # GET /main/marital_statuses/new
  def new
    @main_marital_status = Main::MaritalStatus.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/marital_statuses/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/marital_statuses
  # POST /main/marital_statuses.json
  def create
    @main_marital_status = Main::MaritalStatus.new(main_marital_status_params)

    respond_to do |format|
      if @main_marital_status.save
        format.html { redirect_to main_marital_statuses_path, notice: 'Marital status was successfully created.' }
        format.json { render :show, status: :created, location: @main_marital_status }
      else
        format.js { render "errors" }
        format.html { render :new }
        format.json { render json: @main_marital_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/marital_statuses/1
  # PATCH/PUT /main/marital_statuses/1.json
  def update
    respond_to do |format|
      if @main_marital_status.update(main_marital_status_params)
        format.html { redirect_to main_marital_statuses_path, notice: 'Marital status was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_marital_status }
      else
        format.js { render "errors" }
        format.html { render :edit }
        format.json { render json: @main_marital_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/marital_statuses/1
  # DELETE /main/marital_statuses/1.json
  def destroy
    @main_marital_status.destroy
    respond_to do |format|
      format.html { redirect_to main_marital_statuses_path, notice: 'Marital status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_marital_status
      @main_marital_status = Main::MaritalStatus.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_marital_status_params
      params.require(:main_marital_status).permit(:marital_status)
    end
end
