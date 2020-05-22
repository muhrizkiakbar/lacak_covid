class LSix::ThirdPolicy < ApplicationPolicy
    def index?
      check_access("l_six_third","index")
    end
  
    def create?
        check_access("l_six_third","create")
    end
  
    def new?
        check_access("l_six_third","new")
    end
  
    def show?
        check_access("l_six_third","show")
    end
  
    def update?
        check_access("l_six_third","edit")
    end
  
    def destroy?
        check_access("l_six_third","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  