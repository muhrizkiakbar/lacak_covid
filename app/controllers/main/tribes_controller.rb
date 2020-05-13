class Main::TribesController < ApplicationController
  before_action :set_main_tribe, only: [:show, :edit, :update, :destroy]

  # GET /main/tribes
  # GET /main/tribes.json
  def index
    @main_tribes = Main::Tribe.all
  end

  # GET /main/tribes/1
  # GET /main/tribes/1.json
  def show
  end

  # GET /main/tribes/new
  def new
    @main_tribe = Main::Tribe.new
    respond_to do |format|
      format.js
    end
  end

  # GET /main/tribes/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /main/tribes
  # POST /main/tribes.json
  def create
    @main_tribe = Main::Tribe.new(main_tribe_params)

    respond_to do |format|
      if @main_tribe.save
        format.html { redirect_to main_tribes_path, notice: 'Tribe was successfully created.' }
        format.json { render :show, status: :created, location: @main_tribe }
      else
        format.html { render :new }
        format.json { render json: @main_tribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main/tribes/1
  # PATCH/PUT /main/tribes/1.json
  def update
    respond_to do |format|
      if @main_tribe.update(main_tribe_params)
        format.html { redirect_to main_tribes_path, notice: 'Tribe was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_tribe }
      else
        format.html { render :edit }
        format.json { render json: @main_tribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main/tribes/1
  # DELETE /main/tribes/1.json
  def destroy
    @main_tribe.destroy
    respond_to do |format|
      format.html { redirect_to main_tribes_path, notice: 'Tribe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_tribe
      @main_tribe = Main::Tribe.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_tribe_params
      params.require(:main_tribe).permit(:tribe)
    end
end
