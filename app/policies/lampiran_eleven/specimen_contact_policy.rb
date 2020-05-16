class LampiranEleven::SpecimenContactPolicy < ApplicationPolicy
  def index?
    check_access("specimen_contact","index")
  end

  def create?
      check_access("specimen_contact","create")
  end

  def new?
      check_access("specimen_contact","new")
  end

  def show?
      check_access("specimen_contact","show")
  end

  def update?
      check_access("specimen_contact","edit")
  end

  def destroy?
      check_access("specimen_contact","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
