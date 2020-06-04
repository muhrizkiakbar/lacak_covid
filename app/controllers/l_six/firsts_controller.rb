class LSix::FirstsController < ApplicationController
  before_action :set_l_six_first, only: [:show, :edit, :update, :destroy]
  before_action :set_l_six_first_request, only: [:create,:update]
  before_action :data_report_telegrams, only: [:new, :edit, :create,:update]
  # GET /l_six/firsts
  # GET /l_six/firsts.json
  def index
    if !current_user.dinkes_province.nil?
      if !current_user.role.is_show_to_all
        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).where(user_id: current_user.id).page params[:page]
      else
        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).page params[:page]
      end
    elsif !current_user.dinkes_region.nil?

      if current_user.role.is_show_to_all
        hospital = Main::Hospital.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        public_health_center = Main::PublicHealthCenter.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        user = User.where(main_dinkes_region_id: current_user.dinkes_region.id).
                  or( User.where(:main_hospital_id => hospital)).
                  or(User.where(:main_public_health_center_id => public_health_center)).
                  pluck(:id)

        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).where(user_id: user).page params[:page]

      else
        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).where(user_id: current_user.id).page params[:page]

      end
    elsif !current_user.hospital.nil?
      if current_user.role.is_show_to_all
        user = User.where('main_hospital_id = ?', current_user.hospital.id).pluck(:id)
        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).where(user_id: user).page params[:page]
      else
        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).where(user_id: current_user.id).page params[:page]
      end

    else
      if current_user.role.is_show_to_all
        user = User.where('main_public_health_center_id = ?', current_user.public_health_center.id).pluck(:id)
        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).where(user_id: user).page params[:page]
      else
        @search = LSix::First.ransack(params[:q])
        @l_six_firsts = @search.result(distinct: true).where(user_id: current_user.id).page params[:page]
      end

    end
    authorize @l_six_firsts
  end

  # GET /l_six/firsts/1
  # GET /l_six/firsts/1.json
  def show
  end

  # GET /l_six/firsts/new
  def new
    @l_six_first = LSix::First.new


    @user = current_user


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
    @l_six_first.message_ili_reporter = @telegram_message_ili_reporter
    if !@telegram_message_ili_reporter.nil?
      @telegram_message_ili_reporter.user = current_user
      @l_six_first.patient = @telegram_message_ili_reporter.patient
      @telegram_message_ili_reporter.save
    end
    if !@main_patient.nil?
      @l_six_first.patient = @main_patient
    end

    respond_to do |format|
      if @l_six_first.save
        format.html { redirect_to new_l_six_first_second_path(@l_six_first), notice: 'First was successfully created.' }
        format.json { render :show, status: :created, location: @l_six_first }
      else
        format.js { render "errors" }
        # format.html { render :new }
        format.json { render json: @l_six_first.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /l_six/firsts/1
  # PATCH/PUT /l_six/firsts/1.json
  def update
    respond_to do |format|
      @l_six_first.patient = @main_patient
      if !@telegram_message_ili_reporter.nil?
        @telegram_message_ili_reporter.user = current_user
        @l_six_first.patient = @telegram_message_ili_reporter.patient
        @telegram_message_ili_reporter.save
      end
      if @l_six_first.update(l_six_first_params)
        format.html { redirect_to l_six_firsts_path, notice: 'First was successfully updated.' }
        format.json { render :show, status: :ok, location: @l_six_first }
      else
        format.js { render "errors" }
        # format.html { render :edit }
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
      @l_six_first = LSix::First.friendly.find(params[:id])
    end

    def set_l_six_first_request
      params[:l_six_first][:telegram_message_ili_reporter_id].blank? ? @telegram_message_ili_reporter=nil : @telegram_message_ili_reporter = Telegram::MessageIliReporter.friendly.find(params[:l_six_first][:telegram_message_ili_reporter_id])
      params[:l_six_first][:main_patient_id].blank? ? @main_patient = nil : @main_patient = Main::Patient.friendly.find(params[:l_six_first][:main_patient_id])
    end

    # Only allow a list of trusted parameters through.
    def l_six_first_params
      params.require(:l_six_first).permit(:interview_date, :job, :criteria)
    end

    def data_report_telegrams
        if !current_user.dinkes_province.nil?

          if current_user.role.is_show_to_all

            @data_report_telegrams = Telegram::MessageIliReporter.where(user_id: nil)

          else
            username_reporter = Telegram::UsernameReporter.pluck(:id)
            @data_report_telegrams = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)


          end


        elsif !current_user.dinkes_region.nil?

          if current_user.role.is_show_to_all
            username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
            @data_report_telegrams = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

          else
            username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
            @data_report_telegrams = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

          end

        elsif !current_user.hospital.nil?

          if current_user.role.is_show_to_all

            username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
            @data_report_telegrams = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

          else

            username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
            @data_report_telegrams = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

          end

        elsif !current_user.public_health_center.nil?
          if current_user.role.is_show_to_all
            #new
            sub_districts = Main::PhcOfSd.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:main_sub_district_id)

            username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: sub_districts).pluck(:id)
            @data_report_telegrams = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

          else

            sub_districts = Main::PhcOfSd.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:main_sub_district_id)

            username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: sub_districts).pluck(:id)
            @data_report_telegrams = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

          end

        end
    end
end
