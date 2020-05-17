puts "Permission User"
permissions =[
    {
        name: 'User', #Penamaan gasan permission nya
        resource: 'user', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management User', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'users_path' #path di rails route
    },
    {
        name: 'New User', #Penamaan gasan permission nya
        resource: 'user', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add User', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_user_path' #path di rails route
    },
    {
        name: 'Update User', #Penamaan gasan permission nya
        resource: 'user', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change User', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_user_path' #path di rails route
    },
    {
        name: 'Show User', #Penamaan gasan permission nya
        resource: 'user', #nama file di model harus sama
        action: 'show', #nama function di controller
        description: 'Show User', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'user_path' #path di rails route
    },
    {
        name: 'Remove User', #Penamaan gasan permission nya
        resource: 'user', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove User', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'user_path' #path di rails route
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