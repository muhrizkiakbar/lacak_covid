class LampiranEleven::RespiratorySymptomPolicy < ApplicationPolicy
  def index?
    check_access("respiratory_symptom","index")
  end

  def create?
      check_access("respiratory_symptom","create")
  end

  def new?
      check_access("respiratory_symptom","new")
  end

  def show?
      check_access("respiratory_symptom","show")
  end

  def update?
      check_access("respiratory_symptom","edit")
  end

  def destroy?
      check_access("respiratory_symptom","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
