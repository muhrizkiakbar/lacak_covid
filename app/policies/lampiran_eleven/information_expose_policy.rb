class LampiranEleven::InformationExposePolicy < ApplicationPolicy
  def index?
    check_access("information_expose","index")
  end

  def create?
      check_access("information_expose","create")
  end

  def new?
      check_access("information_expose","new")
  end

  def show?
      check_access("information_expose","show")
  end

  def update?
      check_access("information_expose","edit")
  end

  def destroy?
      check_access("information_expose","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
