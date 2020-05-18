class Telegram::MessageReportReporterPolicy < ApplicationPolicy
  def index?
    check_access("message_report_reporter","index")
  end

  def create?
      check_access("telegram_message_message_report_reporter","create")
  end

  def new?
      check_access("telegram_message_message_report_reporter","new")
  end

  def show?
      check_access("telegram_message_message_report_reporter","show")
  end

  def update?
      check_access("telegram_message_message_report_reporter","edit")
  end

  def destroy?
      check_access("telegram_message_message_report_reporter","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
