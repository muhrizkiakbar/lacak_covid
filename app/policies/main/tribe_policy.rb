class Main::TribePolicy < ApplicationPolicy
  def index?
    check_access("tribe","index")
  end

  def create?
      check_access("tribe","create")
  end

  def new?
      check_access("tribe","new")
  end

  def show?
      check_access("tribe","show")
  end

  def update?
      check_access("tribe","edit")
  end

  def destroy?
      check_access("tribe","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
