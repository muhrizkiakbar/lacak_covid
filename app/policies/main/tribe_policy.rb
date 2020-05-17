class Main::TribePolicy < ApplicationPolicy
  def index?
    check_access("main_tribe","index")
  end

  def create?
      check_access("main_tribe","create")
  end

  def new?
      check_access("main_tribe","new")
  end

  def show?
      check_access("main_tribe","show")
  end

  def update?
      check_access("main_tribe","edit")
  end

  def destroy?
      check_access("main_tribe","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
