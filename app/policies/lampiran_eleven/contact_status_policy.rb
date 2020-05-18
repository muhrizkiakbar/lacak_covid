class LampiranEleven::ContactStatusPolicy < ApplicationPolicy
  def index?
    check_access("lampiran_eleven_contact_status","index")
  end

  def create?
      check_access("lampiran_eleven_contact_status","create")
  end

  def new?
      check_access("lampiran_eleven_contact_status","new")
  end

  def show?
      check_access("lampiran_eleven_contact_status","show")
  end

  def update?
      check_access("lampiran_eleven_contact_status","edit")
  end

  def destroy?
      check_access("lampiran_eleven_contact_status","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
