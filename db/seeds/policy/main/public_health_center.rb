puts "Permission Public Health Center"
permissions =[
    {
        name: 'Public Health Center', #Penamaan gasan permission nya
        resource: 'main_public_health_center', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Public Health Center', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_dinkes_province_dinkes_region_public_health_centers_path' #path di rails route
    },
    {
        name: 'New Public Health Center', #Penamaan gasan permission nya
        resource: 'main_public_health_center', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Public Health Center', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_dinkes_province_dinkes_region_public_health_center_path' #path di rails route
    },
    {
        name: 'Update Public Health Center', #Penamaan gasan permission nya
        resource: 'main_public_health_center', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Public Health Center', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_dinkes_province_dinkes_region_public_health_center_path' #path di rails route
    },
    {
        name: 'Remove Public Health Center', #Penamaan gasan permission nya
        resource: 'main_public_health_center', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Public Health Center', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_dinkes_province_dinkes_region_public_health_center_path' #path di rails route
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