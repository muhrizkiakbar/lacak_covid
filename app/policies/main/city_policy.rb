class Main::CityPolicy < ApplicationPolicy
  def index?
    check_access("main_city","index")
  end

  def create?
      check_access("main_city","create")
  end

  def new?
      check_access("main_city","new")
  end

  def show?
      check_access("main_city","show")
  end

  def update?
      check_access("main_city","edit")
  end

  def destroy?
      check_access("main_city","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
