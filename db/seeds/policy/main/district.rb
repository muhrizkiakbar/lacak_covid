puts "Permission District"
permissions =[
    {
        name: 'District', #Penamaan gasan permission nya
        resource: 'main_district', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management District', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_province_city_districts_path' #path di rails route
    },
    {
        name: 'New District', #Penamaan gasan permission nya
        resource: 'main_district', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add District', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_province_city_district_path' #path di rails route
    },
    {
        name: 'Update District', #Penamaan gasan permission nya
        resource: 'main_district', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change District', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_province_city_district_path' #path di rails route
    },
    {
        name: 'Remove District', #Penamaan gasan permission nya
        resource: 'main_district', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove District', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_province_city_district_path' #path di rails route
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