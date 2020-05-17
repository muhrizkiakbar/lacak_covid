class LampiranEleven::OtherSymptomPolicy < ApplicationPolicy
  def index?
    check_access("lampiran_eleven_other_symptom","index")
  end

  def create?
      check_access("lampiran_eleven_other_symptom","create")
  end

  def new?
      check_access("lampiran_eleven_other_symptom","new")
  end

  def show?
      check_access("lampiran_eleven_other_symptom","show")
  end

  def update?
      check_access("lampiran_eleven_other_symptom","edit")
  end

  def destroy?
      check_access("lampiran_eleven_other_symptom","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
