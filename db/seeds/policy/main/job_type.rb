puts "Permission Job Type"
permissions =[
    {
        name: 'Job Type', #Penamaan gasan permission nya
        resource: 'main_job_type', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Job Type', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_job_types_path' #path di rails route
    },
    {
        name: 'New Job Type', #Penamaan gasan permission nya
        resource: 'main_job_type', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Job Type', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_job_type_path' #path di rails route
    },
    {
        name: 'Update Job Type', #Penamaan gasan permission nya
        resource: 'main_job_type', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Job Type', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_job_type_path' #path di rails route
    },
    {
        name: 'Remove Job Type', #Penamaan gasan permission nya
        resource: 'main_job_type', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Job Type', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_job_type_path' #path di rails route
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