puts "Permission Hospital"
permissions =[
    {
        name: 'Hospital', #Penamaan gasan permission nya
        resource: 'main_hospital', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Hospital', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_dinkes_province_dinkes_region_hospitals_path' #path di rails route
    },
    {
        name: 'New Hospital', #Penamaan gasan permission nya
        resource: 'main_hospital', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Hospital', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_dinkes_province_dinkes_region_hospital_path' #path di rails route
    },
    {
        name: 'Update Hospital', #Penamaan gasan permission nya
        resource: 'main_hospital', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Hospital', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_dinkes_province_dinkes_region_hospital_path' #path di rails route
    },
    {
        name: 'Remove Hospital', #Penamaan gasan permission nya
        resource: 'main_hospital', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Hospital', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_dinkes_province_dinkes_region_hospital_path' #path di rails route
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