class LFive::DailyReportController < ApplicationController
    def index 

        if !current_user.dinkes_province.nil?
            
            province = Main::Province.where(province: "Kalimantan Selatan").first

            cities = Main::City.where(main_province_id: province.id).page(params[:page]).per(1)

            @cities = cities

            #
                    data = Hash.new  
                    data[:cities]= Array.new

                    cities.each_with_index do |city,key_city|

                        data[:cities][key_city] = {"cities"=>city, "districts" => Array.new}

                        districts = Main::District.where(main_city_id: city.id)

                        districts.each_with_index do |district,key_district|
                            data[:cities][key_city]["districts"][key_district] = {"district"=>district, "sub_districts" => Array.new}

                            sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                            sub_districts.each_with_index do |sub_district, key_sub_district|
                                
                                # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                                # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)

                                patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                                l_six = LSix::First.where(main_patient_id: patient)

                                # if params[:l_five_daily_report][:date].blank? || params[:l_five_daily_report][:date].nil? || params[:l_five_daily_report][:date] == ""
                                #     l_six = l_six.this_day
                                #     @date = Date.today
                                # else
                                #     date_params = params[:l_five_daily_report][:date]
                                #     l_six = l_six.where(interview_date: date_params)
                                #     @date = date_params
                                # end
                                
                                count_confirm = l_six.count_kk
                                count_odp = l_six.count_odp
                                count_pdp = l_six.count_pdp
                                count_otg = l_six.count_kp
                                

                                sick = l_six.count_sick_of_hospital
                                covered = l_six.count_covered_of_hospital
                                died = l_six.count_died_of_hospital
                                done = l_six.count_done

                                data[:cities][key_city]["districts"][key_district]["sub_districts"][key_sub_district] = {
                                    "sub_district"=>sub_district,
                                    "count_confirm"=>count_confirm.to_s,
                                    "count_odp"=>count_odp.to_s,
                                    "count_pdp"=>count_pdp.to_s,
                                    "count_otg"=>count_otg.to_s,
                                    "sick"=>sick.to_s,
                                    "covered"=>covered.to_s,
                                    "died"=>died.to_s,
                                    "done"=>done.to_s,
                                }
                            end
                        end

                    end
            #
            # @datas = Kaminari.paginate_array(data).page(params[:page]).per(50)

            @datas = data
            # authorize @datas
            render "report_province"

        elsif !current_user.dinkes_region.nil?

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id).page(params[:page]).per(3)
            @districts = districts
            data = Hash.new  

            data[:districts]= Array.new

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    l_six = LSix::First.where(main_patient_id: patient.id)

                    # if params[:l_five_daily_report][:date].blank? || params[:l_five_daily_report][:date].nil? || params[:l_five_daily_report][:date] == ""
                    #     l_six = l_six.this_day
                    #     @date = Date.today
                    # else
                    #     date_params = params[:l_five_daily_report][:date]
                    #     l_six = l_six.where(interview_date: date_params)
                    #     @date = date_params
                    # end
                    
                    count_confirm = l_six.count_kk
                    count_odp = l_six.count_odp
                    count_pdp = l_six.count_pdp
                    count_otg = l_six.count_kp
                    

                    sick = l_six.count_sick_of_hospital
                    covered = l_six.count_covered_of_hospital
                    died = l_six.count_died_of_hospital
                    done = l_six.count_done

                    data[:districts][key_district]["sub_districts"][key_sub_district] = {
                        "sub_district"=>sub_district,
                        "count_confirm"=>count_confirm.to_s,
                        "count_odp"=>count_odp.to_s,
                        "count_pdp"=>count_pdp.to_s,
                        "count_otg"=>count_otg.to_s,
                        "sick"=>sick.to_s,
                        "covered"=>covered.to_s,
                        "died"=>died.to_s,
                        "done"=>done.to_s,
                    }
                end
            end

            @datas = data

            # authorize @datas
            render "report_region"

        elsif !current_user.public_health_center.nil?
            
            @sub_district = current_user.public_health_center.sub_district

            authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center)
            
            # if params[:l_five_daily_report][:date].blank? || params[:l_five_daily_report][:date].nil? || params[:l_five_daily_report][:date] == ""
            #     l_six = l_six.this_day
            #     @date = Date.today
            # else
            #     date_params = params[:l_five_daily_report][:date]
            #     l_six = l_six.where(interview_date: date_params)
            #     @date = date_params
            # end
            
            @count_confirm = l_six.count_kk
            @count_odp = l_six.count_odp
            @count_pdp = l_six.count_pdp
            @count_otg = l_six.count_kp

            @sick = l_six.count_sick_of_hospital
            @covered = l_six.count_covered_of_hospital
            @died = l_six.count_died_of_hospital
            @done = l_six.count_done
        



            
            render "report_sub_district"
        end


    end
end