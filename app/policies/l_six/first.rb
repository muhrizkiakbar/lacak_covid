class LSix::FirstPolicy < ApplicationPolicy
    def index?
      check_access("l_six_first","index")
    end
  
    def create?
        check_access("l_six_first","create")
    end
  
    def new?
        check_access("l_six_first","new")
    end
  
    def show?
        check_access("l_six_first","show")
    end
  
    def update?
        check_access("l_six_first","edit")
    end
  
    def destroy?
        check_access("l_six_first","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  