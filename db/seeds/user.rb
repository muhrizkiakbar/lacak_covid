# module User 
    puts "Add User"
    role=Role.first
    add_user = User.create(
                role_id: role.id,
                username: "diskominfo",
                email: "diskominfo@kalselprov.go.id",
                name: "diskominfo",
                password: "@diskominfo123",
                dinkes_province: Main::DinkesProvince.first,
                dinkes_region: nil,
                hospital: nil,
                public_health_center: nil,
                avatar: nil,
                phone_number: "0811513055"
            )
# end