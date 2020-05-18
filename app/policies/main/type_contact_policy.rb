class Main::TypeContactPolicy < ApplicationPolicy
  def index?
    check_access("main_type_contact","index")
  end

  def create?
      check_access("main_type_contact","create")
  end

  def new?
      check_access("main_type_contact","new")
  end

  def show?
      check_access("main_type_contact","show")
  end

  def update?
      check_access("main_type_contact","edit")
  end

  def destroy?
      check_access("main_type_contact","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
