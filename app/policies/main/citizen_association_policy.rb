class Main::CitizenAssociationPolicy < ApplicationPolicy
  def index?
    check_access("citizen_association","index")
  end

  def create?
      check_access("citizen_association","create")
  end

  def new?
      check_access("citizen_association","new")
  end

  def show?
      check_access("citizen_association","show")
  end

  def update?
      check_access("citizen_association","edit")
  end

  def destroy?
      check_access("citizen_association","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
