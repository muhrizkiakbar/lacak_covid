class Main::TransportationsController < ApplicationController
  before_action :set_main_transportation, only: [:show, :edit, :update, :destroy]

  # GET /main/transportations
  # GET /main/transportations.json
  def index
    @main_transportations = Main::Transportation.all
  end

  # GET /main/transportations/1
  # GET /main/transportations/1.json
  def show
  end

  # GET /main/transportations/new
  def new
    @main_transportation = Main::Transportation.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/transportations/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/transportations
  # POST /main/transportations.json
  def create
    @main_transportation = Main::Transportation.new(main_transportation_params)

    respond_to do |format|
      if @main_transportation.save
        format.html { redirect_to main_transportations_path, notice: 'Transportation was successfully created.' }
        format.json { render :show, status: :created, location: @main_transportation }
      else
        format.html { render :new }
        format.js { render "errors" }
        format.json { render json: @main_transportation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/transportations/1
  # PATCH/PUT /main/transportations/1.json
  def update
    respond_to do |format|
      if @main_transportation.update(main_transportation_params)
        format.html { redirect_to main_transportations_path, notice: 'Transportation was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_transportation }
      else
        format.html { render :edit }
        format.js { render "errors" }
        format.json { render json: @main_transportation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/transportations/1
  # DELETE /main/transportations/1.json
  def destroy
    @main_transportation.destroy
    respond_to do |format|
      format.html { redirect_to main_transportations_path, notice: 'Transportation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_transportation
      @main_transportation = Main::Transportation.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_transportation_params
      params.require(:main_transportation).permit(:transportation)
    end
end
