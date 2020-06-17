
class LContactList::ContactListPolicy < ApplicationPolicy
    def index?
      check_access("l_contact_list_contact_list","index")
    end
  
    def create?
        check_access("l_contact_list_contact_list","create")
    end
  
    def new?
        check_access("l_contact_list_contact_list","new")
    end
  
    def show?
        check_access("l_contact_list_contact_list","show")
    end
  
    def update?
        check_access("l_contact_list_contact_list","edit")
    end
  
    def destroy?
        check_access("l_contact_list_contact_list","destroy")
    end
  
    private
  
    def check_access resource, action
        RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
    end
end
  
