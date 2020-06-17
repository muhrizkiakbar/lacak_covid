
class LContactList::ContactPatientPolicy < ApplicationPolicy
    def index?
      check_access("l_contact_list_contact_patient","index")
    end
  
    def create?
        check_access("l_contact_list_contact_patient","create")
    end
  
    def new?
        check_access("l_contact_list_contact_patient","new")
    end
  
    def show?
        check_access("l_contact_list_contact_patient","show")
    end
  
    def update?
        check_access("l_contact_list_contact_patient","edit")
    end
  
    def destroy?
        check_access("l_contact_list_contact_patient","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
end
  
