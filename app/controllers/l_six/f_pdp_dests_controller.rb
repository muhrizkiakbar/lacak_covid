class LSix::FPdpDestsController < ApplicationController
  before_action :set_l_six_f_pdp_dest, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_f_pdp_dest_url
  # GET /l_six/f_pdp_dests
  # GET /l_six/f_pdp_dests.json
  def index
    @l_six_f_pdp_dests = LSix::FPdpDest.all
  end

  # GET /l_six/f_pdp_dests/1
  # GET /l_six/f_pdp_dests/1.json
  def show
  end

  # GET /l_six/f_pdp_dests/new
  def new
    @l_six_f_pdp_dest = LSix::FPdpDest.new
    authorize @l_six_f_pdp_dest
  end

  # GET /l_six/f_pdp_dests/1/edit
  def edit
    authorize @l_six_f_pdp_dest
  end

  # POST /l_six/f_pdp_dests
  # POST /l_six/f_pdp_dests.json
  def create
    @l_six_f_pdp_dest = LSix::FPdpDest.new(l_six_f_pdp_dest_params)
    @l_six_f_pdp_dest.ls_fourth = @l_six_fourth
    respond_to do |format|
      if @l_six_f_pdp_dest.save
        format.html { redirect_to l_six_first_path(@l_six_first), notice: 'F pdp dest was successfully created.' }
        format.json { render :show, status: :created, location: @l_six_f_pdp_dest }
      else
        format.html { render :new }
        format.json { render json: @l_six_f_pdp_dest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/f_pdp_dests/1
  # PATCH/PUT /l_six/f_pdp_dests/1.json
  def update
    respond_to do |format|
      if @l_six_f_pdp_dest.update(l_six_f_pdp_dest_params)
        format.html { redirect_to l_six_first_path(@l_six_first), notice: 'F pdp dest was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_f_pdp_dest }
      else
        format.html { render :edit }
        format.json { render json: @l_six_f_pdp_dest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_six/f_pdp_dests/1
  # DELETE /l_six/f_pdp_dests/1.json
  def destroy
    authorize @l_six_f_pdp_dest
    @l_six_f_pdp_dest.destroy
    respond_to do |format|
      format.html { redirect_to l_six_first_path(@l_six_first), notice: 'F pdp dest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_f_pdp_dest_url
      @l_six_first = LSix::First.friendly.find(params[:first_id])
      @l_six_fourth = LSix::Fourth.friendly.find(params[:fourth_id])
    end
    
    def set_l_six_f_pdp_dest
      @l_six_f_pdp_dest = LSix::FPdpDest.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_f_pdp_dest_params
      params.require(:l_six_f_pdp_dest).permit(:name, :address, :relation, :date_contact, :last_date_contact)
    end
end
