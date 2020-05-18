class Main::TransportationPolicy < ApplicationPolicy
  def index?
    check_access("main_transportation","index")
  end

  def create?
      check_access("main_transportation","create")
  end

  def new?
      check_access("main_transportation","new")
  end

  def show?
      check_access("main_transportation","show")
  end

  def update?
      check_access("main_transportation","edit")
  end

  def destroy?
      check_access("main_transportation","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
