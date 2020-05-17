class LampiranEleven::InfoExposesOfficerPolicy < ApplicationPolicy
  def index?
    check_access("lampiran_eleven_info_exposes_officer","index")
  end

  def create?
      check_access("lampiran_eleven_info_exposes_officer","create")
  end

  def new?
      check_access("lampiran_eleven_info_exposes_officer","new")
  end

  def show?
      check_access("lampiran_eleven_info_exposes_officer","show")
  end

  def update?
      check_access("lampiran_eleven_info_exposes_officer","edit")
  end

  def destroy?
      check_access("lampiran_eleven_info_exposes_officer","destroy")
  end

  private

  def check_access resource, action
      RolePermission.check_status(user.role,Permission.check_resource_and_action(resource,action))
  end
end
