class Telegram::MessageTravelerReporterPolicy < ApplicationPolicy
  def index?
    check_access("telegram_message_traveler_reporter","index")
  end

  def create?
      check_access("telegram_message_traveler_reporter","create")
  end

  def new?
      check_access("telegram_message_traveler_reporter","new")
  end

  def show?
      check_access("telegram_message_traveler_reporter","show")
  end

  def update?
      check_access("telegram_message_traveler_reporter","edit")
  end

  def destroy?
      check_access("telegram_message_traveler_reporter","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end