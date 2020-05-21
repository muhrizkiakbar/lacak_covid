class LSix::TCheckothersController < ApplicationController
  before_action :set_l_six_t_checkother, only: [:show, :edit, :update, :destroy]

  # GET /l_six/t_checkothers
  # GET /l_six/t_checkothers.json
  def index
    @l_six_t_checkothers = LSix::TCheckother.all
  end

  # GET /l_six/t_checkothers/1
  # GET /l_six/t_checkothers/1.json
  def show
  end

  # GET /l_six/t_checkothers/new
  def new
    @l_six_t_checkother = LSix::TCheckother.new
  end

  # GET /l_six/t_checkothers/1/edit
  def edit
  end

  # POST /l_six/t_checkothers
  # POST /l_six/t_checkothers.json
  def create
    @l_six_t_checkother = LSix::TCheckother.new(l_six_t_checkother_params)

    respond_to do |format|
      if @l_six_t_checkother.save
        format.html { redirect_to @l_six_t_checkother, notice: 'T checkother was successfully created.' }
        format.json { render :show, status: :created, location: @l_six_t_checkother }
      else
        format.html { render :new }
        format.json { render json: @l_six_t_checkother.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/t_checkothers/1
  # PATCH/PUT /l_six/t_checkothers/1.json
  def update
    respond_to do |format|
      if @l_six_t_checkother.update(l_six_t_checkother_params)
        format.html { redirect_to @l_six_t_checkother, notice: 'T checkother was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_t_checkother }
      else
        format.html { render :edit }
        format.json { render json: @l_six_t_checkother.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_six/t_checkothers/1
  # DELETE /l_six/t_checkothers/1.json
  def destroy
    @l_six_t_checkother.destroy
    respond_to do |format|
      format.html { redirect_to l_six_t_checkothers_url, notice: 'T checkother was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_t_checkother
      @l_six_t_checkother = LSix::TCheckother.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_t_checkother_params
      params.require(:l_six_t_checkother).permit(:l_six_third_id, :other_check, :date_check_other, :place_check_other, :result_check_other)
    end
end
