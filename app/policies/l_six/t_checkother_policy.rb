class LSix::TCheckotherPolicy < ApplicationPolicy
    def index?
      check_access("l_six_t_checkother","index")
    end
  
    def create?
        check_access("l_six_t_checkother","create")
    end
  
    def new?
        check_access("l_six_t_checkother","new")
    end
  
    def show?
        check_access("l_six_t_checkother","show")
    end
  
    def update?
        check_access("l_six_t_checkother","edit")
    end
  
    def destroy?
        check_access("l_six_t_checkother","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  