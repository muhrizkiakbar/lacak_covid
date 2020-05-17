puts "Permission Province"
permissions =[
    {
        name: 'Province', #Penamaan gasan permission nya
        resource: 'province', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Province', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_provinces_path' #path di rails route
    },
    {
        name: 'New Province', #Penamaan gasan permission nya
        resource: 'province', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Province', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_province_path' #path di rails route
    },
    {
        name: 'Update Province', #Penamaan gasan permission nya
        resource: 'province', #nama file di model harus sama
        action: 'update', #nama function di controller
        description: 'Change Province', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_province_path' #path di rails route
    },
    {
        name: 'Remove Province', #Penamaan gasan permission nya
        resource: 'province', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Province', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_province_path' #path di rails route
    },
    # =================================================================
]


permissions.each_with_index do |permission,key|
    add_permissions= Permission.create(
      name: permission[:name], #Penamaan gasan permission nya
      resource: permission[:resource], #nama file di model harus sama
      action: permission[:action], #nama function di controller
      description: permission[:description], #gasan penjelasan aja
      page: permission[:page], #ini akan bisa di akses di menu atau tidak
      path: permission[:path] #path di rails route
    )
end