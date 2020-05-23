class LSix::FPositiveDestPolicy < ApplicationPolicy
    def index?
      check_access("l_six_f_positive_dest","index")
    end
  
    def create?
        check_access("l_six_f_positive_dest","create")
    end
  
    def new?
        check_access("l_six_f_positive_dest","new")
    end
  
    def show?
        check_access("l_six_f_positive_dest","show")
    end
  
    def update?
        check_access("l_six_f_positive_dest","edit")
    end
  
    def destroy?
        check_access("l_six_f_positive_dest","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  