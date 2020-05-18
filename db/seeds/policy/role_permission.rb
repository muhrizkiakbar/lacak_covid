puts "Permission Role"
permissions =[
    {
        name: 'Role Permission', #Penamaan gasan permission nya
        resource: 'role_permission', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Access of User', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'role_role_permissions_path' #path di rails route
    },
    # =================================================================
]


permissions.each_with_index do |permission,key|
    add_permissions = Permission.create(
        name: permission[:name], #Penamaan gasan permission nya
        resource: permission[:resource], #nama file di model harus sama
        action: permission[:action], #nama function di controller
        description: permission[:description], #gasan penjelasan aja
        page: permission[:page], #ini akan bisa di akses di menu atau tidak
        path: permission[:path] #path di rails route
    )
end