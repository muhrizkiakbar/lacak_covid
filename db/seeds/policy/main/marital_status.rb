puts "Permission Marital Status"
permissions =[
    {
        name: 'Marital Status', #Penamaan gasan permission nya
        resource: 'main_marital_status', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Marital Status', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_marital_statuses_path' #path di rails route
    },
    {
        name: 'New Marital Status', #Penamaan gasan permission nya
        resource: 'main_marital_status', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Marital Status', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_marital_status_path' #path di rails route
    },
    {
        name: 'Update Marital Status', #Penamaan gasan permission nya
        resource: 'main_marital_status', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Marital Status', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_marital_status_path' #path di rails route
    },
    {
        name: 'Remove Marital Status', #Penamaan gasan permission nya
        resource: 'main_marital_status', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Marital Status', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_marital_status_path' #path di rails route
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