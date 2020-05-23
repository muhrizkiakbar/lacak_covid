class LSix::FAboardDestPolicy < ApplicationPolicy
    def index?
      check_access("l_six_f_aboard_dest","index")
    end
  
    def create?
        check_access("l_six_f_aboard_dest","create")
    end
  
    def new?
        check_access("l_six_f_aboard_dest","new")
    end
  
    def show?
        check_access("l_six_f_aboard_dest","show")
    end
  
    def update?
        check_access("l_six_f_aboard_dest","edit")
    end
  
    def destroy?
        check_access("l_six_f_aboard_dest","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  