    puts "Permission Dinkes Province"
    permissions =[
        {
            name: 'Dinkes Province', #Penamaan gasan permission nya
            resource: 'main_dinkes_province', #nama file di model harus sama
            action: 'index', #nama function di controller
            description: 'Management Dinkes Province', #gasan penjelasan aja
            page: true, #ini akan bisa di akses di menu atau tidak
            path: 'main_dinkes_provinces_path' #path di rails route
        },
        {
            name: 'New Dinkes Province', #Penamaan gasan permission nya
            resource: 'main_dinkes_province', #nama file di model harus sama
            action: 'new', #nama function di controller
            description: 'Add Dinkes Province', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'new_main_dinkes_province_path' #path di rails route
        },
        {
            name: 'Update Dinkes Province', #Penamaan gasan permission nya
            resource: 'main_dinkes_province', #nama file di model harus sama
            action: 'edit', #nama function di controller
            description: 'Change Dinkes Province', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'edit_main_dinkes_province_path' #path di rails route
        },
        {
            name: 'Remove Dinkes Province', #Penamaan gasan permission nya
            resource: 'main_dinkes_province', #nama file di model harus sama
            action: 'destroy', #nama function di controller
            description: 'Remove Dinkes Province', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'main_dinkes_province_path' #path di rails route
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