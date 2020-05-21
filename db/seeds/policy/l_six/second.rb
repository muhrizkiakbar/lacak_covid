puts "Permission Clinic Information"
permissions =[
    {
        name: 'New Clinic Information', #Penamaan gasan permission nya
        resource: 'l_six_second', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Clinic Information', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_l_six_first_second_path' #path di rails route
    },
    {
        name: 'Update Clinic Information', #Penamaan gasan permission nya
        resource: 'lampiran_eleven_close_contact', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Update Clinic Information', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_l_six_first_second_path' #path di rails route
    },
    {
        name: 'Remove Clinic Information', #Penamaan gasan permission nya
        resource: 'lampiran_eleven_close_contact', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Clinic Information', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_six_first_second_path' #path di rails route
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