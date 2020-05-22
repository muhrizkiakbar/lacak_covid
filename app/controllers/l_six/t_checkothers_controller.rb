class LSix::TCheckothersController < ApplicationController
  before_action :set_l_six_t_checkother, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_t_checkother_url
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
    puts "======================================"
    params[:l_six_t_checkother][:other_check].each_with_index do |value,key|
        puts params[:l_six_t_checkother][:other_check][key]
        puts params[:l_six_t_checkother][:date_check_other][key]
        @l_six_t_checkother = LSix::TCheckother.new
        @l_six_t_checkother.other_check = params[:l_six_t_checkother][:other_check][key]
        @l_six_t_checkother.date_check_other = params[:l_six_t_checkother][:date_check_other][key]
        @l_six_t_checkother.place_check_other = params[:l_six_t_checkother][:place_check_other][key]
        @l_six_t_checkother.result_check_other = params[:l_six_t_checkother][:result_check_other][key]
        @l_six_t_checkother.ls_third = @l_six_third
        @l_six_t_checkother.save

    end
    redirect_to new_l_six_first_second_third_fourth_path(@l_six_first,@l_six_second,@l_six_third), notice: 'T checkother was successfully created.'
    # respond_to do |format|
      # if @l_six_t_checkother.save
        # format.html { redirect_to new_l_six_first_second_third_fourth_path(@l_six_first,@l_six_second,@l_six_third), notice: 'T checkother was successfully created.' }
        # format.json { render :show, status: :created, location: @l_six_t_checkother }
      # else
      #   format.html { render :new }
      #   format.json { render json: @l_six_t_checkother.errors, status: :unprocessable_entity }
      # end
    # end
  end

  # PATCH/PUT /l_six/t_checkothers/1
  # PATCH/PUT /l_six/t_checkothers/1.json
  def update
    respond_to do |format|
      if @l_six_t_checkother.update(l_six_t_checkother_params)
        format.html { redirect_to l_six_firsts_path, notice: 'T checkother was successfully updated.' }
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
      format.html { redirect_to l_six_firsts_path, notice: 'T checkother was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_l_six_t_checkother_url
      @l_six_first = LSix::First.friendly.find(params[:first_id])
      @l_six_second = LSix::Second.friendly.find(params[:second_id])
      @l_six_third = LSix::Third.friendly.find(params[:third_id])
    end

    def set_l_six_t_checkother
      @l_six_t_checkother = LSix::TCheckother.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_t_checkother_params
      params.require(:l_six_t_checkother).permit( :other_check, :date_check_other, :place_check_other, :result_check_other)
    end
end
