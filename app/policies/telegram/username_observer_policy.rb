class Telegram::UsernameObserverPolicy < ApplicationPolicy
  def index?
    check_access("username_observer","index")
  end

  def create?
      check_access("username_observer","create")
  end

  def new?
      check_access("username_observer","new")
  end

  def show?
      check_access("username_observer","show")
  end

  def update?
      check_access("username_observer","edit")
  end

  def destroy?
      check_access("username_observer","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
