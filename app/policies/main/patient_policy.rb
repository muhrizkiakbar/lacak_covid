class Main::PatientPolicy < ApplicationPolicy
  def index?
    check_access("main_patient","index")
  end

  def create?
      check_access("main_patient","create")
  end

  def new?
      check_access("main_patient","new")
  end

  def show?
      check_access("main_patient","show")
  end

  def update?
      check_access("main_patient","edit")
  end

  def destroy?
      check_access("main_patient","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
