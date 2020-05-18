class Main::NeighborhoodAssociationPolicy < ApplicationPolicy
  def index?
    check_access("main_neighborhood_association","index")
  end

  def create?
      check_access("main_neighborhood_association","create")
  end

  def new?
      check_access("main_neighborhood_association","new")
  end

  def show?
      check_access("main_neighborhood_association","show")
  end

  def update?
      check_access("main_neighborhood_association","edit")
  end

  def destroy?
      check_access("main_neighborhood_association","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
