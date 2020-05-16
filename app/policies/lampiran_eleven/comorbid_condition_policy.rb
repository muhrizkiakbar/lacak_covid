class LampiranEleven::ComorbidConditionPolicy < ApplicationPolicy
  def index?
    check_access("comorbid_condition","index")
  end

  def create?
      check_access("comorbid_condition","create")
  end

  def new?
      check_access("comorbid_condition","new")
  end

  def show?
      check_access("comorbid_condition","show")
  end

  def update?
      check_access("comorbid_condition","edit")
  end

  def destroy?
      check_access("comorbid_condition","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
