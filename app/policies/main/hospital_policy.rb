class Main::HospitalPolicy < ApplicationPolicy
  def index?
    check_access("main_hospital","index")
  end

  def create?
      check_access("main_hospital","create")
  end

  def new?
      check_access("main_hospital","new")
  end

  def show?
      check_access("main_hospital","show")
  end

  def update?
      check_access("main_hospital","edit")
  end

  def destroy?
      check_access("main_hospital","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
