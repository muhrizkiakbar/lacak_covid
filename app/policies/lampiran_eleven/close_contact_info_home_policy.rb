class LampiranEleven::CloseContactInfoHomePolicy < ApplicationPolicy
  def index?
    check_access("close_contact_info_home","index")
  end

  def create?
      check_access("close_contact_info_home","create")
  end

  def new?
      check_access("close_contact_info_home","new")
  end

  def show?
      check_access("close_contact_info_home","show")
  end

  def update?
      check_access("close_contact_info_home","edit")
  end

  def destroy?
      check_access("close_contact_info_home","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
