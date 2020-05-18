class Main::ProvincePolicy < ApplicationPolicy
  def index?
    check_access("main_province","index")
  end

  def create?
      check_access("main_province","create")
  end

  def new?
      check_access("main_province","new")
  end

  def show?
      check_access("main_province","show")
  end

  def update?
      check_access("main_province","edit")
  end

  def destroy?
      check_access("main_province","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
