class Main::TransportationPolicy < ApplicationPolicy
  def index?
    check_access("transportation","index")
  end

  def create?
      check_access("transportation","create")
  end

  def new?
      check_access("transportation","new")
  end

  def show?
      check_access("transportation","show")
  end

  def update?
      check_access("transportation","edit")
  end

  def destroy?
      check_access("transportation","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
