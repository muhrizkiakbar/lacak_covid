puts "Permission Set Location"
permissions =[
    {
        name: 'Set Location', #Penamaan gasan permission nya
        resource: 'set_location', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Set Location', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_set_locations_path' #path di rails route
    },
    {
        name: 'New Set Location', #Penamaan gasan permission nya
        resource: 'set_location', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Set Location', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_set_location_path' #path di rails route
    },
    {
        name: 'Update Set Location', #Penamaan gasan permission nya
        resource: 'set_location', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Set Location', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_set_location_path' #path di rails route
    },
    {
        name: 'Remove Set Location', #Penamaan gasan permission nya
        resource: 'set_location', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Set Location', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_set_location_path' #path di rails route
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