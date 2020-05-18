class Telegram::MessageCheckinReporterPolicy < ApplicationPolicy
  def index?
    check_access("telegram_message_checkin_reporter","index")
  end

  def create?
      check_access("telegram_message_checkin_reporter","create")
  end

  def new?
      check_access("telegram_message_checkin_reporter","new")
  end

  def show?
      check_access("telegram_message_checkin_reporter","show")
  end

  def update?
      check_access("telegram_message_checkin_reporter","edit")
  end

  def destroy?
      check_access("telegram_message_checkin_reporter","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end