class Telegram::MessageIliObserverPolicy < ApplicationPolicy
  def index?
    check_access("telegram_message_message_ili_observer","index")
  end

  def create?
      check_access("telegram_message_message_ili_observer","create")
  end

  def new?
      check_access("telegram_message_message_ili_observer","new")
  end

  def show?
      check_access("telegram_message_message_ili_observer","show")
  end

  def update?
      check_access("telegram_message_message_ili_observer","edit")
  end

  def destroy?
      check_access("telegram_message_message_ili_observer","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
