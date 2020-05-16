class Main::DistrictPolicy < ApplicationPolicy
  def index?
    check_access("district","index")
  end

  def create?
      check_access("district","create")
  end

  def new?
      check_access("district","new")
  end

  def show?
      check_access("district","show")
  end

  def update?
      check_access("district","edit")
  end

  def destroy?
      check_access("district","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
