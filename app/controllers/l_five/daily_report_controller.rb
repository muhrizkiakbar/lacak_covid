class LFive::DailyReportController < ApplicationController
    # def index


    #     if !current_user.dinkes_province.nil?
        
    #     elsif !current_user.dinkes_region.nil?

    #         districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

    #         data = Hash.new  

    #         districts.each do |district|
    #             data[:datas] << 
    #         end

    #     elsif !current_user.public_health_center.nil?
            
    #         sub_district = current_user.public_health_center.sub_district
    #         user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

    #         l_six = LSix::First.where(user_id: user_public_health_center)
            
    #         if params[:user][:date].blank? || params[:user][:date].nil? || params[:user][:date] == ""
    #             l_six = l_six.this_day
    #             @date = Date.today
    #         else
    #             date_params = params[:user][:date]
    #             l_six = l_six.where(interview_date: date_params)
    #             @date = date_params
    #         end
            
    #         @count_confirm = l_six.count_kk
    #         @count_odp = l_six.count_odp
    #         @count_pdp = l_six.count_pdp
    #         @count_otg = l_six.count_kp

    #         @sick = l_six.second.count_sick
    #         @covered = l_six.second.count_covered
    #         @died = l_six.second.count_died
    #         @done = l_six.count_done
            
    #     end

    # end
end
