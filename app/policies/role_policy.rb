class RolePolicy < ApplicationPolicy
  def index?
    check_access("role","index")
  end

  def create?
      check_access("role","create")
  end

  def new?
      check_access("role","new")
  end

  def show?
      check_access("role","show")
  end

  def update?
      check_access("role","edit")
  end

  def destroy?
      check_access("role","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
