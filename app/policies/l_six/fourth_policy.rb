class LSix::FourthPolicy < ApplicationPolicy
    def index?
      check_access("l_six_fourth","index")
    end
  
    def create?
        check_access("l_six_fourth","create")
    end
  
    def new?
        check_access("l_six_fourth","new")
    end
  
    def show?
        check_access("l_six_fourth","show")
    end
  
    def update?
        check_access("l_six_fourth","edit")
    end
  
    def destroy?
        check_access("l_six_fourth","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  