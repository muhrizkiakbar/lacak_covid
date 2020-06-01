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
                                
                                public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                                user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)

                                l_six = LSix::First.where(user_id: user_public_health_center)

                                # if params[:user][:date].blank? || params[:user][:date].nil? || params[:user][:date] == ""
                                #     l_six = l_six.this_day
                                #     @date = Date.today
                                # else
                                #     date_params = params[:user][:date]
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
                                    "count_confirm"=>count_confirm,
                                    "count_odp"=>count_odp,
                                    "count_otg"=>count_otg,
                                    "sick"=>sick,
                                    "covered"=>covered,
                                    "died"=>died,
                                    "done"=>done,
                                }
                            end
                        end

                    end
            #
            # @datas = Kaminari.paginate_array(data).page(params[:page]).per(50)

            @datas = data

            render "report_province"

        elsif !current_user.dinkes_region.nil?

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            data = Hash.new  

            data[:districts]= Array.new

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)

                    l_six = LSix::First.where(user_id: user_public_health_center)

                    if params[:user][:date].blank? || params[:user][:date].nil? || params[:user][:date] == ""
                        l_six = l_six.this_day
                        @date = Date.today
                    else
                        date_params = params[:user][:date]
                        l_six = l_six.where(interview_date: date_params)
                        @date = date_params
                    end
                    
                    count_confirm = l_six.count_kk
                    count_odp = l_six.count_odp
                    count_pdp = l_six.count_pdp
                    count_otg = l_six.count_kp
        
                    sick = l_six.second.count_sick
                    covered = l_six.second.count_covered
                    died = l_six.second.count_died
                    done = l_six.count_done

                    data[:districts][key_district]["sub_districts"][key_sub_district] = {
                        "sub_district"=>sub_district,
                        "count_confirm"=>count_confirm,
                        "count_odp"=>count_odp,
                        "count_otg"=>count_otg,
                        "sick"=>sick,
                        "covered"=>covered,
                        "died"=>died,
                        "done"=>done,
                    }
                end
            end

            @datas = Kaminari.paginate_array(data).page(params[:page])

            render :partial => "report_region", :locals => @datas

        elsif !current_user.public_health_center.nil?
            
            sub_district = current_user.public_health_center.sub_district
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center)
            
            if params[:user][:date].blank? || params[:user][:date].nil? || params[:user][:date] == ""
                l_six = l_six.this_day
                @date = Date.today
            else
                date_params = params[:user][:date]
                l_six = l_six.where(interview_date: date_params)
                @date = date_params
            end
            
            @count_confirm = l_six.count_kk
            @count_odp = l_six.count_odp
            @count_pdp = l_six.count_pdp
            @count_otg = l_six.count_kp

            @sick = l_six.second.count_sick
            @covered = l_six.second.count_covered
            @died = l_six.second.count_died
            @done = l_six.count_done
            
            render :partial => "report_sub_district", :locals => { 
                :count_confirm => @count_confirm,
                :count_odp => @count_odp,
                :count_pdp => @count_pdp,
                :count_otg => @count_otg,
                :sick => @sick,
                :covered => @covered,
                :died => @died,
                :done => @done,
            }
        end


    end
end
