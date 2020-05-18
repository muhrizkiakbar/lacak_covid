    puts "Permission Dinkes Region"
    permissions =[
        {
            name: 'Dinkes Region', #Penamaan gasan permission nya
            resource: 'main_dinkes_region', #nama file di model harus sama
            action: 'index', #nama function di controller
            description: 'Management Dinkes Region', #gasan penjelasan aja
            page: true, #ini akan bisa di akses di menu atau tidak
            path: 'main_dinkes_province_dinkes_regions_path' #path di rails route
        },
        {
            name: 'New Dinkes Region', #Penamaan gasan permission nya
            resource: 'main_dinkes_region', #nama file di model harus sama
            action: 'new', #nama function di controller
            description: 'Add Dinkes Region', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'new_main_dinkes_province_dinkes_region_path' #path di rails route
        },
        {
            name: 'Update Dinkes Region', #Penamaan gasan permission nya
            resource: 'main_dinkes_region', #nama file di model harus sama
            action: 'edit', #nama function di controller
            description: 'Change Dinkes Region', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'edit_main_dinkes_province_dinkes_region_path' #path di rails route
        },
        {
            name: 'Remove Dinkes Region', #Penamaan gasan permission nya
            resource: 'main_dinkes_region', #nama file di model harus sama
            action: 'destroy', #nama function di controller
            description: 'Remove Dinkes Region', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'main_dinkes_province_dinkes_region_path' #path di rails route
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