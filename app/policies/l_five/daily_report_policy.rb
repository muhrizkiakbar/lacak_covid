class LFive::DailyReportPolicy < ApplicationPolicy
    def index?
      check_access("l_five_daily_report","index")
    end
  
    def create?
        check_access("l_five_daily_report","create")
    end
  
    def new?
        check_access("l_five_daily_report","new")
    end
  
    def show?
        check_access("l_five_daily_report","show")
    end
  
    def update?
        check_access("l_five_daily_report","edit")
    end
  
    def destroy?
        check_access("l_five_daily_report","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  