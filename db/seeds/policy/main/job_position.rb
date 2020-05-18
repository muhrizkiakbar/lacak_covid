puts "Permission Job Position"
permissions =[
    {
        name: 'Job Position', #Penamaan gasan permission nya
        resource: 'main_job_position', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Job Position', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_job_positions_path' #path di rails route
    },
    {
        name: 'New Job Position', #Penamaan gasan permission nya
        resource: 'main_job_position', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Job Position', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_job_position_path' #path di rails route
    },
    {
        name: 'Update Job Position', #Penamaan gasan permission nya
        resource: 'main_job_position', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Job Position', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_job_position_path' #path di rails route
    },
    {
        name: 'Remove Job Position', #Penamaan gasan permission nya
        resource: 'main_job_position', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Job Position', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_job_position_path' #path di rails route
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