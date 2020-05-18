class UserPolicy < ApplicationPolicy
  def index?
    check_access("user","index")
  end

  def create?
      check_access("user","create")
  end

  def new?
      check_access("user","new")
  end

  def show?
      check_access("user","show")
  end

  def update?
      check_access("user","edit")
  end

  def destroy?
      check_access("user","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
