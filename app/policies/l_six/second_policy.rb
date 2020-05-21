class LSix::SecondPolicy < ApplicationPolicy
    def index?
      check_access("l_six_second","index")
    end
  
    def create?
        check_access("l_six_second","create")
    end
  
    def new?
        check_access("l_six_second","new")
    end
  
    def show?
        check_access("l_six_second","show")
    end
  
    def update?
        check_access("l_six_second","edit")
    end
  
    def destroy?
        check_access("l_six_second","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  