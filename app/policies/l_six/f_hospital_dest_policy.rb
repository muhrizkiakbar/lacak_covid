class LSix::FHospitalDestPolicy < ApplicationPolicy
    def index?
      check_access("l_six_f_hospital_dest","index")
    end
  
    def create?
        check_access("l_six_f_hospital_dest","create")
    end
  
    def new?
        check_access("l_six_f_hospital_dest","new")
    end
  
    def show?
        check_access("l_six_f_hospital_dest","show")
    end
  
    def update?
        check_access("l_six_f_hospital_dest","edit")
    end
  
    def destroy?
        check_access("l_six_f_hospital_dest","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
  end
  