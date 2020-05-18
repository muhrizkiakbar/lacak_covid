# module Role 
    puts "Add Role"

    roles = ["Superadmin"]

    roles.each do |role|
        add = Role.create(
            name: role
        )
    end


    # PERMISSION
    # require 'seeder/permission'


    roles = Role.all
    permissions = Permission.all

    puts "Create Role Permissions"
    roles.each do |role|
        permissions.each do |permission|
            role_permission = RolePermission.new
            role_permission.role=role
            role_permission.permission=permission
            role_permission.save
        end
    end
# end