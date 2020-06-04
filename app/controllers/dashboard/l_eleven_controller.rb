class Dashboard::LElevenController < ApplicationController
    before_action :delimitter_date
    def index
        render "index"
    end

    def get_count_odp
        @count_odp = 0
        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_odp = @count_odp + l_six.count_odp
            else

                @count_odp = @count_odp + 0
            end

            render json: @count_odp

        elsif !current_user.dinkes_region.nil?

            @count_odp = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)
            # @districts = districts
            data = Hash.new  

            data[:districts]= Array.new

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_odp = @count_odp + l_six.count_odp
                        

                    else
                        @count_odp = 0
                       
                    end


                    
                end
            end

            render json: @count_odp 

        elsif !current_user.public_health_center.nil?
            
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_odp = @count_odp + l_six.count_odp
                

            else
                @count_odp = @count_odp + 0
               
            end

            render json: @count_odp
        end
    end

    def get_count_pdp
        @count_pdp = 0
        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_pdp += l_six.count_pdp
            else

                @count_pdp += 0
            end

            render json: @count_pdp

        elsif !current_user.dinkes_region.nil?

            @count_pdp = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_pdp += l_six.count_pdp
                        

                    else
                        @count_pdp += 0
                       
                    end


                    
                end
            end

            render json: @count_pdp 

        elsif !current_user.public_health_center.nil?
            
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_pdp += l_six.count_pdp
                

            else
                @count_pdp += 0
               
            end

            render json: @count_pdp
        end
    end

    def get_count_otg
        @count_otg = 0
        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_otg += l_six.count_kp
            else

                @count_otg += 0
            end

            render json: @count_otg

        elsif !current_user.dinkes_region.nil?

            @count_otg = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_otg += l_six.count_kp
                        

                    else
                        @count_otg += 0
                       
                    end


                    
                end
            end

            render json: @count_otg 

        elsif !current_user.public_health_center.nil?
            
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_otg += l_six.count_kp
                

            else
                @count_otg += 0
               
            end

            render json: @count_otg
        end
    end

    def get_count_confirm
        @count_kk = 0

        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_kk += l_six.count_kk
            else

                @count_kk += 0
            end

            render json: @count_kk

        elsif !current_user.dinkes_region.nil?

            @count_kk = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_kk += l_six.count_kk
                        

                    else
                        @count_kk += 0
                       
                    end


                    
                end
            end

            render json: @count_kk 

        elsif !current_user.public_health_center.nil?
            @count_kk = 0 
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_kk += l_six.count_kk
                

            else
                @count_kk += 0
               
            end

            render json: @count_kk
        end
    end

    def get_count_done
        @count_done = 0
        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_done += l_six.count_done
            else

                @count_done += 0
            end

            render json: @count_done

        elsif !current_user.dinkes_region.nil?

            @count_done = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_done += l_six.count_done
                        

                    else
                        @count_done += 0
                       
                    end


                    
                end
            end

            render json: @count_done 

        elsif !current_user.public_health_center.nil?
            @count_done = 0
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_done += l_six.count_done
                

            else
                @count_done += 0
               
            end

            render json: @count_done
        end
    end

    def get_count_sick
        @count_sick_of_hospital = 0
        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_sick_of_hospital += l_six.count_sick_of_hospital
            else

                @count_sick_of_hospital += 0
            end

            render json: @count_sick_of_hospital

        elsif !current_user.dinkes_region.nil?

            @count_sick_of_hospital = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_sick_of_hospital += l_six.count_sick_of_hospital
                        

                    else
                        @count_sick_of_hospital += 0
                       
                    end


                    
                end
            end

            render json: count_sick_of_hospital 

        elsif !current_user.public_health_center.nil?
            @count_sick_of_hospital=0 
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_sick_of_hospital += l_six.count_sick_of_hospital
                

            else
                @count_sick_of_hospital += 0
               
            end

            render json: count_sick_of_hospital
        end
    end

    def get_count_died
        @count_died_of_hospital = 0
        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_died_of_hospital += l_six.count_died_of_hospital
            else

                @count_died_of_hospital += 0
            end

            render json: @count_died_of_hospital

        elsif !current_user.dinkes_region.nil?

            @count_died_of_hospital = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_died_of_hospital += l_six.count_died_of_hospital
                        

                    else
                        @count_died_of_hospital += 0
                       
                    end


                    
                end
            end

            render json: @count_died_of_hospital 

        elsif !current_user.public_health_center.nil?
            
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_died_of_hospital += l_six.count_died_of_hospital
                

            else
                @count_died_of_hospital += 0
               
            end

            render json: @count_died_of_hospital
        end
    end

    def get_count_covered
        @count_covered_of_hospital = 0
        if !current_user.dinkes_province.nil?
          
            patient = Main::Patient.pluck(:id)


            if patient.any?
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct
                # l_six = LSix::First.where(main_patient_id: patient).select(:main_patient_id,:id).order(interview_date: :desc).distinct

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                @count_covered_of_hospital += l_six.count_covered_of_hospital
            else

                @count_covered_of_hospital += 0
            end

            render json: @count_covered_of_hospital

        elsif !current_user.dinkes_region.nil?

            @count_covered_of_hospital = 0

            districts = Main::District.where(main_city_id: current_user.dinkes_region.city.id)

            districts.each_with_index do |district,key_district|
                data[:districts][key_district] = {"district"=>district, "sub_districts" => Array.new}

                sub_districts = Main::SubDistrict.where(main_district_id: district.id)

                sub_districts.each_with_index do |sub_district, key_sub_district|
                    
                    # public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: sub_district.id).pluck(:id)

                    # user_public_health_center = User.where(main_public_health_center_id: public_health_center).pluck(:id)
                    
                    patient = Main::Patient.where(main_sub_district_id: sub_district.id).pluck(:id)

                    if patient.length > 0
                        l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                        if @start_date.nil? || @end_date.nil?
                            l_six = l_six.this_day
                        else
                            l_six = l_six.where(interview_date: @start_date..@end_date)
                        end
                        
                        @count_covered_of_hospital += l_six.count_covered_of_hospital
                        

                    else
                        @count_covered_of_hospital += 0
                       
                    end


                    
                end
            end

            render json: @count_covered_of_hospital 

        elsif !current_user.public_health_center.nil?
            
            @sub_district = current_user.public_health_center.sub_district

            # authorize @sub_district
            
            user_public_health_center = User.where(main_public_health_center_id: current_user.public_health_center.id).pluck(:id)

            l_six = LSix::First.where(user_id: user_public_health_center).lastest_by_patient
            
            if user_public_health_center.length > 0
                l_six = LSix::First.where(main_patient_id: patient).lastest_by_patient

                if @start_date.nil? || @end_date.nil?
                    l_six = l_six.this_day
                else
                    l_six = l_six.where(interview_date: @start_date..@end_date)
                end
                
                @count_covered_of_hospital += l_six.count_covered_of_hospital
                

            else
                @count_covered_of_hospital += 0
               
            end

            render json: @count_covered_of_hospital
        end
    end

    private

    def delimitter_date
        if params[:date].nil?
            @start_date = nil
            @end_date = nil
        else
            date = params[:date].split(" ")
            if date.length = 2 
                @start_date = date[0]
                @end_date = date [1]
            else
                @start_date = nil
                @end_date = nil
            end
        end
        
    end
end
