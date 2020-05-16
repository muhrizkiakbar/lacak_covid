class Main::CityPolicy < ApplicationPolicy
  def index?
    check_access("city","index")
  end

  def create?
      check_access("city","create")
  end

  def new?
      check_access("city","new")
  end

  def show?
      check_access("city","show")
  end

  def update?
      check_access("city","edit")
  end

  def destroy?
      check_access("city","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
