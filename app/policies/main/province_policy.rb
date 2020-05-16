class Main::ProvincePolicy < ApplicationPolicy
  def index?
    check_access("province","index")
  end

  def create?
      check_access("province","create")
  end

  def new?
      check_access("province","new")
  end

  def show?
      check_access("province","show")
  end

  def update?
      check_access("province","edit")
  end

  def destroy?
      check_access("province","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
