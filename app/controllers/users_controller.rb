class UsersController < ApplicationController
  before_action :set_user, only: [:edit,:update,:show, :destroy]
  before_action :allow_without_password, only: [:update, :update_profile]
  before_action :user_request_params, only: [:create, :update]
  before_action :set_current_user, only: [:update_profile]
  # before_action :not_change_email_or_username, only: [:update_profile]

  def index
    @search = User.ransack(params[:q])

    if !current_user.dinkes_province.nil?

        @users = @search.result(distinct: true).page params[:page]
     
    elsif !current_user.dinkes_region.nil?

      # if current_user.role.is_show_to_all
        public_health_center = Main::PublicHealthCenter.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        @users = @search.result(distinct: true).where(main_public_health_center_id: public_health_center).page params[:page]
        
      # else

        # @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
        # @lampiran_eleven_close_contact_informations = @search.result(distinct: true).where(user_id: current_user.id).page params[:page]

      # end
    # elsif !current_user.hospital.nil?
      # if current_user.role.is_show_to_all
      #   user = User.where('main_hospital_id = ?', current_user.hospital.id).pluck(:id)

      #   @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
      #   @lampiran_eleven_close_contact_informations = @search.result(distinct: true).where(user_id: user).page params[:page]
      # else

      #   @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
      #   @lampiran_eleven_close_contact_informations = @search.result(distinct: true).where(user_id: current_user.id).page params[:page]
      # end

    elsif !current_user.public_health_center.nil?
      @users = @search.result(distinct: true).where(main_public_health_center_id: current_user.public_health_center.id).page params[:page]
        
      # if current_user.role.is_show_to_all
      #   user = User.where('main_public_health_center_id = ?', current_user.public_health_center.id).pluck(:id)

      #   @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
      #   @lampiran_eleven_close_contact_informations = @search.result(distinct: true).where(user_id: user).page params[:page]
      # else

      #   @search = LampiranEleven::CloseContactInformation.ransack(params[:q])
      #   @lampiran_eleven_close_contact_informations = @search.result(distinct: true).where(user_id: current_user.id).page params[:page]
      # end
    else
      @users = @search.result(distinct: true).page params[:page] 
    end
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
    respond_to do |format|
        format.js
    end

  end

  def create
    @user = User.new(user_full_params)
    
    @user.dinkes_province = @main_dinkes_province
    if current_user.dinkes_province.nil?
      @user.dinkes_province = nil
    end
    @user.dinkes_region = @main_dinkes_region
    @user.hospital = @main_hospital
    @user.public_health_center = @main_public_health_center

    

    @user.role = @role
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        # format.html { render :new }
        format.js { render 'errors'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @user
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      @user.dinkes_province = @main_dinkes_province
      @user.dinkes_region = @main_dinkes_region
      @user.hospital = @main_hospital
      @user.public_health_center = @main_public_health_center
      if !current_user.dinkes_region.nil?
        @user.dinkes_region = current_user.dinkes_region
      end 
      if !current_user.public_health_center.nil?
        @user.public_health_center = current_user.public_health_center
      end 
      @user.role = @role
      if @user.email != params[:user][:email]
        if @user.update(user_full_params)
          
          format.html { redirect_to users_path(), notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          puts "tes==========="
          puts @user.errors
          format.js { render 'errors'}
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        
        if @user.update(user_full_params_without_email)
          format.html { redirect_to users_path(), notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          puts "tes==========="
          puts @user.errors
          format.js { render 'errors'}
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def show
  end

  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_profile
    @user = current_user
    if !current_user.dinkes_province.nil?

      if current_user.role.is_show_to_all
        @count_cc_information = LampiranEleven::CloseContactInformation.this_month.count
        @count_l_six_first = LSix::First.this_month.count 


        @count_report_telegram = Telegram::MessageReportReporter.this_month.count 
        
        @message_report_reporters = Telegram::MessageReportReporter.last(5)
        
        @group_message_report_reporter = Telegram::MessageReportReporter.group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.group_by_day(:created_at).count

      else
        username_reporter = Telegram::UsernameReporter.pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        hospital = Main::Hospital.pluck(:id)
        public_health_center = Main::PublicHealthCenter.pluck(:id)
        user = User.pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).this_month.count
        @count_l_six_first = LSix::First.this_month.count

        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)


        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        
      end


    elsif !current_user.dinkes_region.nil?

      if current_user.role.is_show_to_all
        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        hospital = Main::Hospital.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        public_health_center = Main::PublicHealthCenter.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        user = User.where(main_dinkes_region_id: current_user.dinkes_region.id).
                  or( User.where(:main_hospital_id => hospital)).
                  or(User.where(:main_public_health_center_id => public_health_center)).
                  pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: user).this_month.count
        @count_l_six_first = LSix::First.where(user_id: user).this_month.count
        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)


        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
      else
        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.dinkes_region.city.id).pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        hospital = Main::Hospital.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        public_health_center = Main::PublicHealthCenter.where(main_dinkes_region_id: current_user.dinkes_region.id).pluck(:id)
        user = User.where(main_dinkes_region_id: current_user.dinkes_region.id).
                  or( User.where(:main_hospital_id => hospital)).
                  or(User.where(:main_public_health_center_id => public_health_center)).
                  pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).this_month.count
        @count_l_six_first = LSix::First.where(user_id: current_user.id).this_month.count
        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)


        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count

      end
      
    elsif !current_user.hospital.nil?

      if current_user.role.is_show_to_all

        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        user = User.joins(:hospital).where("main_hospitals.id = ? ", current_user.hospital.id).
                  pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: user).this_month.count
        @count_l_six_first = LSix::First.where(user_id: user).this_month.count
        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)
        
        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
      else

        username_reporter = Telegram::UsernameReporter.where(main_city_id: current_user.hospital.dinkes_region.city.id).pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        user = User.joins(:hospital).where("main_hospitals.id = ? ", current_user.hospital.id).
                  pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).this_month.count
        @count_l_six_first = LSix::First.where(user_id: current_user.id).this_month.count
        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)
        
        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
      end

    elsif !current_user.public_health_center.nil?
      if current_user.role.is_show_to_all

        #new
        sub_districts = Main::PhcOfSd.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:main_sub_district_id)

        username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: sub_districts).pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        user = User.joins(:public_health_center).where("main_public_health_centers.id = ? ", current_user.public_health_center.id).
                  pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: user).this_month.count
        @count_l_six_first = LSix::First.where(user_id: user).this_month.count
        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)
        
        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        
      else
        #new
        sub_districts = Main::PhcOfSd.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:main_sub_district_id)

        username_reporter = Telegram::UsernameReporter.where(main_sub_district_id: sub_districts).pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        user = User.joins(:public_health_center).where("main_public_health_centers.id = ? ", current_user.public_health_center.id).
                  pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).this_month.count
        @count_l_six_first = LSix::First.where(user_id: current_user.id).this_month.count
        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)
        
        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        
      end
    else
      if current_user.role.is_show_to_all
        @count_cc_information = LampiranEleven::CloseContactInformation.this_month.count
        @count_l_six_first = LSix::First.this_month.count 


        @count_report_telegram = Telegram::MessageReportReporter.this_month.count 
        
        @message_report_reporters = Telegram::MessageReportReporter.last(5)
        
        @group_message_report_reporter = Telegram::MessageReportReporter.group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.group_by_day(:created_at).count

      else
        username_reporter = Telegram::UsernameReporter.pluck(:id)
        @count_report_telegram = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).this_month.count

        hospital = Main::Hospital.pluck(:id)
        public_health_center = Main::PublicHealthCenter.pluck(:id)
        user = User.pluck(:id)

        @count_cc_information = LampiranEleven::CloseContactInformation.where(user_id: current_user.id).this_month.count
        @count_l_six_first = LSix::First.this_month.count

        @message_report_reporters = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).order(created_at: :desc).last(5)


        @group_message_report_reporter = Telegram::MessageReportReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_ili_reporter = Telegram::MessageIliReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        @group_message_closecont_reporter = Telegram::MessageClosecontReporter.where(telegram_username_reporter_id: username_reporter).group_by_day(:created_at).count
        
      end
    end

    
    
  end

  def edit_profile

    @user = User.find(current_user.id)
  end

  def update_profile

    # respond_to do |format|
      if (!params[:user][:password].blank?) || (!params[:user][:password].nil?) || (!params[:user][:password] == "")


        if @user.update_with_password(user_params)
          
          # Sign in the user by passing validation in case their password changed
          bypass_sign_in(@user)
          redirect_to show_profile_path, notice: 'You was successfully change profile.'
          # format.json {redirect_to show_profile_path, notice: 'You was successfully change profile.'}
        else
          redirect_to show_profile_path, notice: 'You was failed change profile.'
          # format.html { render :edit_profile }
          # format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
          puts "=" * 100
          puts user_params
          if @user.update(user_params)
            # Sign in the user by passing validation in case their password changed
            # bypass_sign_in(@user)
            redirect_to show_profile_path, notice: 'You was successfully change profile.'
            # format.json {redirect_to show_profile_path, notice: 'You was successfully change profile.'}
          else
            redirect_to show_profile_path, notice: 'You was failed change profile.'
            # format.html { render :edit_profile }
            # format.json { render json: @user.errors, status: :unprocessable_entity }
            # render_plain "tes"
          end

      # end
    end
  end

  private
    
    def user_params
      params.require(:user).permit(:email, :username, :avatar, :password,:password_confirmation,:current_password, :name, :phone_number)
    end

    def user_params_without_email
      params.require(:user).permit(:avatar, :password,:password_confirmation,:current_password, :name, :phone_number)
    end

    def user_request_params
      (params[:user][:main_dinkes_province_id].nil?) || (params[:user][:main_dinkes_province_id].blank?) ? @main_dinkes_province = nil : @main_dinkes_province = Main::DinkesProvince.friendly.find(params[:user][:main_dinkes_province_id])
      
      (params[:user][:main_dinkes_region_id].nil?) || (params[:user][:main_dinkes_region_id].blank?) ? @main_dinkes_region = nil : @main_dinkes_region = Main::DinkesRegion.friendly.find(params[:user][:main_dinkes_region_id])
      (params[:user][:main_hospital_id].nil?) || (params[:user][:main_hospital_id].blank?) ? @main_hospital = nil : @main_hospital = Main::Hospital.friendly.find(params[:user][:main_hospital_id])
      if !current_user.dinkes_region.nil?
        # @main_dinkes_province = current_user.dinkes_region
        puts "*" * 100
      end 
      if !current_user.public_health_center.nil?
        @main_public_health_center = current_user.public_health_center
        puts "=" * 100
      end 
      (params[:user][:main_public_health_center_id].nil?) || (params[:user][:main_public_health_center_id].blank?) ? @main_public_health_center = nil : @main_public_health_center = Main::PublicHealthCenter.friendly.find(params[:user][:main_public_health_center_id])
      @role = Role.friendly.find(params[:user][:role_id])
    end

    def user_full_params
      params.require(:user).permit(:email, :username, :password,:password_confirmation, :name, :phone_number, :avatar)
    end
    
    def user_full_params_without_email
      params.require(:user).permit(:email,:username, :password,:password_confirmation, :name, :phone_number, :avatar)
    end

    def set_user
      @user = User.friendly.find(params[:id])
    end

    def set_current_user
      @user = User.friendly.find(current_user.id)
    end

    def not_change_email_or_username
      # if params[:user][:email] == current_user.email
      #   params[:user].delete(:email)
      # end 
    end

    def allow_without_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
          params[:user].delete(:password)
          params[:user].delete(:password_confirmation)
          params[:user].delete(:current_password)
      end
      # if params[:user][:email] == current_user.email
      #   params[:user].delete(:email)
      # end 
    end
end
