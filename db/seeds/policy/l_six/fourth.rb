puts "Permission Exposure Contact Factor"
permissions =[
    {
        name: 'New Exposure Contact Factor', #Penamaan gasan permission nya
        resource: 'l_six_fourth', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Exposure Contact Factor', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_l_six_first_second_third_fourth_path' #path di rails route
    },
    {
        name: 'Update Exposure Contact Factor', #Penamaan gasan permission nya
        resource: 'l_six_fourth', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Update Exposure Contact Factor', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_l_six_first_second_third_fourth_path' #path di rails route
    },
    {
        name: 'Remove Exposure Contact Factor', #Penamaan gasan permission nya
        resource: 'l_six_fourth', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Exposure Contact Factor', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_six_first_second_third_fourth_path' #path di rails route
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