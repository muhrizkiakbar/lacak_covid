class Main::SetLocationPolicy < ApplicationPolicy
  def index?
    check_access("main_set_location","index")
  end

  def create?
      check_access("main_set_location","create")
  end

  def new?
      check_access("main_set_location","new")
  end

  def show?
      check_access("main_set_location","show")
  end

  def update?
      check_access("main_set_location","edit")
  end

  def destroy?
      check_access("main_set_location","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
