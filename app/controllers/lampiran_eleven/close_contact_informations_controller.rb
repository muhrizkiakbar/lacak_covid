class LampiranEleven::CloseContactInformationsController < ApplicationController
  before_action :set_lampiran_eleven_close_contact_information, only: [:show, :edit, :update, :destroy]
  before_action :set_lampiran_eleven_close_contact_information_params, only: [:create,:update]
  # GET /lampiran_eleven/close_contact_informations
  # GET /lampiran_eleven/close_contact_informations.json
  def index
    
    if !current_user.dinkes_province.nil?
      if current_user.role.is_show_to_all
        @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
        @lampiran_eleven_close_contact_informations = @search.result(distinct: true).where(user_id: user).page params[:page]
      else
        @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
        @lampiran_eleven_close_contact_informations = @search.result(distinct: true).page params[:page]
      end
    elsif !current_user.dinkes_region.nil?

      if current_user.role.is_show_to_all
        hospital = Main::Hospital.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        public_health_center = Main::PublicHealthCenter.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        user = User.where(main_dinkes_region_id: current_user.dinkes_region.id).
                  or( User.where(:main_hospital_id => hospital)).
                  or(User.where(:main_public_health_center_id => public_health_center)).
                  pluck(:id)

        @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: user).page params[:page]

      else

        @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).page params[:page]

      end
    elsif !current_user.hospital.nil?
      if current_user.role.is_show_to_all
        user = User.where('main_hospital_id = ?', current_user.hospital.id).pluck(:id)
        @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: user).page params[:page]
      else
        @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).page params[:page]
      end

    else
      if current_user.role.is_show_to_all
        user = User.where('main_public_health_center_id = ?', current_user.public_health_center.id).pluck(:id)
        @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: user).page params[:page]
      else
        @lampiran_eleven_close_contact_informations = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).page params[:page]
      end
      
    end
    
    authorize @lampiran_eleven_close_contact_informations
  end

  # GET /lampiran_eleven/close_contact_informations/1
  # GET /lampiran_eleven/close_contact_informations/1.json
  def show
  end

  # GET /lampiran_eleven/close_contact_informations/new
  def new
    @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.new


    @user = current_user
    if !current_user.dinkes_province.nil?

      if current_user.role.is_show_to_all

        @data_report_telegrams = Telegram::MessageCloseconttReporter.where(user_id: nil)

      else
        username_reporter = Telegram::UsernameReporter.pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

        
      end


    elsif !current_user.dinkes_region.nil?

      if current_user.role.is_show_to_all
        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      else
        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      end
      
    elsif !current_user.hospital.nil?

      if current_user.role.is_show_to_all

        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      else

        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      end

    elsif !current_user.public_health_center.nil?
      if current_user.role.is_show_to_all
        username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: current_user.public_health_center.sub_district.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      else
        username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: current_user.public_health_center.sub_district.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      end
      
    end

    
    

    authorize @lampiran_eleven_close_contact_information
  end

  # GET /lampiran_eleven/close_contact_informations/1/edit
  def edit

    @user = current_user
    if !current_user.dinkes_province.nil?

      if current_user.role.is_show_to_all

        @data_report_telegrams = Telegram::MessageCloseconttReporter.where(user_id: nil)

      else
        username_reporter = Telegram::UsernameReporter.pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

        
      end


    elsif !current_user.dinkes_region.nil?

      if current_user.role.is_show_to_all
        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      else
        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      end
      
    elsif !current_user.hospital.nil?

      if current_user.role.is_show_to_all

        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      else

        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      end

    elsif !current_user.public_health_center.nil?
      if current_user.role.is_show_to_all
        username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: current_user.public_health_center.sub_district.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      else
        username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: current_user.public_health_center.sub_district.id).pluck(:id)
        @data_report_telegrams = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).where(user_id: nil)

      end
      
    end
    
    authorize @lampiran_eleven_close_contact_information
  end

  # POST /lampiran_eleven/close_contact_informations
  # POST /lampiran_eleven/close_contact_informations.json
  def create
    @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.new(lampiran_eleven_close_contact_information_params)
    @lampiran_eleven_close_contact_information.patient = @main_patient
    @lampiran_eleven_close_contact_information.public_health_center = @main_public_health_center
    @lampiran_eleven_close_contact_information.message_closecont_reporter = @telegram_message_closecont_reporter
    if !@telegram_message_closecont_reporter.nil?
      @telegram_message_closecont_reporter.user = current_user
      @telegram_message_closecont_reporter.save
    end
    
    @lampiran_eleven_close_contact_information.user = @user
    respond_to do |format|
      if @lampiran_eleven_close_contact_information.save
        format.html { redirect_to new_lampiran_eleven_close_contact_information_information_expose_path @lampiran_eleven_close_contact_information, notice: 'Close contact information was successfully created.' }
        format.json { render :show, status: :created, location: @lampiran_eleven_close_contact_information }
      else
        format.html { render :new }
        format.json { render json: @lampiran_eleven_close_contact_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lampiran_eleven/close_contact_informations/1
  # PATCH/PUT /lampiran_eleven/close_contact_informations/1.json
  def update
    respond_to do |format|

    @lampiran_eleven_close_contact_information.patient = @main_patient
    @lampiran_eleven_close_contact_information.public_health_center = @main_public_health_center
    @lampiran_eleven_close_contact_information.user = @user
      if @lampiran_eleven_close_contact_information.update(lampiran_eleven_close_contact_information_params)
        format.html { redirect_to new_lampiran_eleven_close_contact_information_information_expose_path @lampiran_eleven_close_contact_information, notice: 'Close contact information was successfully updated.' }
        format.json { render :show, status: :ok, location: @lampiran_eleven_close_contact_information }
      else
        format.html { render :edit }
        format.json { render json: @lampiran_eleven_close_contact_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lampiran_eleven/close_contact_informations/1
  # DELETE /lampiran_eleven/close_contact_informations/1.json
  def destroy
    authorize @lampiran_eleven_close_contact_information
    @lampiran_eleven_close_contact_information.destroy
    respond_to do |format|
      format.html { redirect_to lampiran_eleven_close_contact_informations_url, notice: 'Close contact information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lampiran_eleven_close_contact_information_params
      @main_patient = Main::Patient.friendly.find(params[:lampiran_eleven_close_contact_information][:main_patient_id])
      @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:lampiran_eleven_close_contact_information][:main_public_health_center_id])
      params[:l_six_first][:telegram_message_closecont_reporter_id].blank? ? @telegram_message_closecont_reporter=nil : @telegram_message_closecont_reporter = Telegram::MessageClosecontReporter.friendly.find(params[:l_six_first][:telegram_message_closecont_reporter_id])
      @user = current_user
    end

    def set_lampiran_eleven_close_contact_information
      @lampiran_eleven_close_contact_information = LampiranEleven::CloseContactInformation.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lampiran_eleven_close_contact_information_params
      params.require(:lampiran_eleven_close_contact_information).permit(:fill_in_date, :contact_tracking_date, :contact_with_positive_case, :placement)
    end
end
