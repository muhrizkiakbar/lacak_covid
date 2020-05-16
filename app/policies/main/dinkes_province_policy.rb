class Main::DinkesProvincePolicy < ApplicationPolicy
  def index?
    check_access("dinkes_province","index")
  end

  def create?
      check_access("dinkes_province","create")
  end

  def new?
      check_access("dinkes_province","new")
  end

  def show?
      check_access("dinkes_province","show")
  end

  def update?
      check_access("dinkes_province","edit")
  end

  def destroy?
      check_access("dinkes_province","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
    def resolve
      scope.all
    end
  end
end
