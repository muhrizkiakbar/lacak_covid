class Main::SubDistrictPolicy < ApplicationPolicy
  def index?
    check_access("sub_district","index")
  end

  def create?
      check_access("sub_district","create")
  end

  def new?
      check_access("sub_district","new")
  end

  def show?
      check_access("sub_district","show")
  end

  def update?
      check_access("sub_district","edit")
  end

  def destroy?
      check_access("sub_district","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
