class LampiranEleven::CloseContactPolicy < ApplicationPolicy
  def index?
    check_access("close_contact","index")
  end

  def create?
      check_access("close_contact","create")
  end

  def new?
      check_access("close_contact","new")
  end

  def show?
      check_access("close_contact","show")
  end

  def update?
      check_access("close_contact","edit")
  end

  def destroy?
      check_access("close_contact","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
