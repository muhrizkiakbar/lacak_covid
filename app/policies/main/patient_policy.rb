class Main::PatientPolicy < ApplicationPolicy
  def index?
    check_access("patient","index")
  end

  def create?
      check_access("patient","create")
  end

  def new?
      check_access("patient","new")
  end

  def show?
      check_access("patient","show")
  end

  def update?
      check_access("patient","edit")
  end

  def destroy?
      check_access("patient","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
