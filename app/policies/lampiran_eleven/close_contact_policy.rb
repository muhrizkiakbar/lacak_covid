class LampiranEleven::CloseContactPolicy < ApplicationPolicy
  def index?
    check_access("lampiran_eleven_close_contact","index")
  end

  def create?
      check_access("lampiran_eleven_close_contact","create")
  end

  def new?
      check_access("lampiran_eleven_close_contact","new")
  end

  def show?
      check_access("lampiran_eleven_close_contact","show")
  end

  def update?
      check_access("lampiran_eleven_close_contact","edit")
  end

  def destroy?
      check_access("lampiran_eleven_close_contact","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
