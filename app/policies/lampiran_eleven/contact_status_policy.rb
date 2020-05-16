class LampiranEleven::ContactStatusPolicy < ApplicationPolicy
  def index?
    check_access("contact_status","index")
  end

  def create?
      check_access("contact_status","create")
  end

  def new?
      check_access("contact_status","new")
  end

  def show?
      check_access("contact_status","show")
  end

  def update?
      check_access("contact_status","edit")
  end

  def destroy?
      check_access("contact_status","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
