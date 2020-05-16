class Main::JobTypePolicy < ApplicationPolicy
  def index?
    check_access("job_type","index")
  end

  def create?
      check_access("job_type","create")
  end

  def new?
      check_access("job_type","new")
  end

  def show?
      check_access("job_type","show")
  end

  def update?
      check_access("job_type","edit")
  end

  def destroy?
      check_access("job_type","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end