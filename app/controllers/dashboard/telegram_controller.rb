class Dashboard::TelegramController < ApplicationController
    def user


        

        # @total_count_inactive_user_reporter = Telegram::UsernameReporter.where.not(last_activity_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).where.not(last_activity_at: nil)
        # @total_count_user_reporter = Telegram::UsernameReporter.count
        # @total_count_user_observer = Telegram::UsernameObserver.count
        # @reporter_have_most_report = Telegram::UsernameReporter.
        
        # # for dinkes_prov
        #     @most_report_of_city =

        #     # for dinkes_region
        #         @most_report_of_sub_district =
        #     # end for dinkes region

        #     # for public health center
        #         @most_report_of_citizen =
        #         @most_report_of_neighborhood =
        #     # end for public_health center

        # # end for dinkes_prov
        # if !current_user.dinkes_province.nil?

        # elsif !current_user.dinkes_region.nil?

        # elsif !current_user.public_health_center.nil?

        # end
        
    end
end
