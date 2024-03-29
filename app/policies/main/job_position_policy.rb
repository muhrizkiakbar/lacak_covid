class Main::JobPositionPolicy < ApplicationPolicy
  def index?
    check_access("main_job_position","index")
  end

  def create?
      check_access("main_job_position","create")
  end

  def new?
      check_access("main_job_position","new")
  end

  def show?
      check_access("main_job_position","show")
  end

  def update?
      check_access("main_job_position","edit")
  end

  def destroy?
      check_access("main_job_position","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
