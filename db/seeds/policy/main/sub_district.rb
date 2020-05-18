puts "Permission Sub District"
permissions =[
    {
        name: 'Sub District', #Penamaan gasan permission nya
        resource: 'main_sub_district', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Sub District', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_province_city_district_sub_districts_path' #path di rails route
    },
    {
        name: 'New Sub District', #Penamaan gasan permission nya
        resource: 'main_sub_district', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Sub District', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_province_city_district_sub_district_path' #path di rails route
    },
    {
        name: 'Update Sub District', #Penamaan gasan permission nya
        resource: 'main_sub_district', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Sub District', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_province_city_district_sub_district_path' #path di rails route
    },
    {
        name: 'Remove Sub District', #Penamaan gasan permission nya
        resource: 'main_sub_district', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Sub District', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_province_city_district_sub_district_path' #path di rails route
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