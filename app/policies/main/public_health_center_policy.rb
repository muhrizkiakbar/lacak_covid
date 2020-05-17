class Main::PublicHealthCenterPolicy < ApplicationPolicy
  def index?
    check_access("main_public_health_center","index")
  end

  def create?
      check_access("main_public_health_center","create")
  end

  def new?
      check_access("main_public_health_center","new")
  end

  def show?
      check_access("main_public_health_center","show")
  end

  def update?
      check_access("main_public_health_center","edit")
  end

  def destroy?
      check_access("main_public_health_center","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
