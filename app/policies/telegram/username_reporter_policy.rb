class Telegram::UsernameReporterPolicy < ApplicationPolicy
  def index?
    check_access("username_reporter","index")
  end

  def create?
      check_access("username_reporter","create")
  end

  def new?
      check_access("username_reporter","new")
  end

  def show?
      check_access("username_reporter","show")
  end

  def update?
      check_access("username_reporter","edit")
  end

  def destroy?
      check_access("username_reporter","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
