class Main::HospitalPolicy < ApplicationPolicy
  def index?
    check_access("hospital","index")
  end

  def create?
      check_access("hospital","create")
  end

  def new?
      check_access("hospital","new")
  end

  def show?
      check_access("hospital","show")
  end

  def update?
      check_access("hospital","edit")
  end

  def destroy?
      check_access("hospital","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
