class Main::DinkesRegionPolicy < ApplicationPolicy
  def index?
    check_access("dinkes_region","index")
  end

  def create?
      check_access("dinkes_region","create")
  end

  def new?
      check_access("dinkes_region","new")
  end

  def show?
      check_access("dinkes_region","show")
  end

  def update?
      check_access("dinkes_region","edit")
  end

  def destroy?
      check_access("dinkes_region","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
