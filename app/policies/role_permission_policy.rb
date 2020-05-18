class RolePermissionPolicy < ApplicationPolicy
  def index?
    check_access("role_permission","index")
  end

  def create?
      check_access("role_permission","create")
  end

  def new?
      check_access("role_permission","new")
  end

  def show?
      check_access("role_permission","show")
  end

  def update?
      check_access("role_permission","edit")
  end

  def destroy?
      check_access("role_permission","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
