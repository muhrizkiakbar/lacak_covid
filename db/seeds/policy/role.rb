puts "Permission Role"
permissions =[
    {
        name: 'Role', #Penamaan gasan permission nya
        resource: 'role', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Role', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'roles_path' #path di rails route
    },
    {
        name: 'New Role', #Penamaan gasan permission nya
        resource: 'role', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Role', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_role_path' #path di rails route
    },
    {
        name: 'Update Role', #Penamaan gasan permission nya
        resource: 'role', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Role', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_role_path' #path di rails route
    },
    {
        name: 'Remove Role', #Penamaan gasan permission nya
        resource: 'role', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Role', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'role_path' #path di rails route
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