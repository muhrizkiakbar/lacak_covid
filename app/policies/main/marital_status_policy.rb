class Main::MaritalStatusPolicy < ApplicationPolicy
  def index?
    check_access("main_marital_status","index")
  end

  def create?
      check_access("main_marital_status","create")
  end

  def new?
      check_access("main_marital_status","new")
  end

  def show?
      check_access("main_marital_status","show")
  end

  def update?
      check_access("main_marital_status","edit")
  end

  def destroy?
      check_access("main_marital_status","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
