class LSix::FifthPolicy < ApplicationPolicy
    def index?
      check_access("l_six_fifth","index")
    end
  
    def create?
        check_access("l_six_fifth","create")
    end
  
    def new?
        check_access("l_six_fifth","new")
    end
  
    def show?
        check_access("l_six_fifth","show")
    end
  
    def update?
        check_access("l_six_fifth","edit")
    end
  
    def destroy?
        check_access("l_six_fifth","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  