class LampiranEleven::CloseContactInformationPolicy < ApplicationPolicy
  def index?
    check_access("close_contact_information","index")
  end

  def create?
      check_access("close_contact_information","create")
  end

  def new?
      check_access("close_contact_information","new")
  end

  def show?
      check_access("close_contact_information","show")
  end

  def update?
      check_access("close_contact_information","edit")
  end

  def destroy?
      check_access("close_contact_information","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
