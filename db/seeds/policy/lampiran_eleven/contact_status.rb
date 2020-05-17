    puts "Permission Contact Status"
    permissions =[
        {
            name: 'New Contact Status', #Penamaan gasan permission nya
            resource: 'contact_status', #nama file di model harus sama
            action: 'new', #nama function di controller
            description: 'Add Contact Status', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'new_lampiran_eleven_close_contact_information_contact_status_path	' #path di rails route
        },
        {
            name: 'Update Contact Status', #Penamaan gasan permission nya
            resource: 'contact_status', #nama file di model harus sama
            action: 'edit', #nama function di controller
            description: 'Update Contact Status', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'edit_lampiran_eleven_close_contact_information_contact_status_path' #path di rails route
        },
        {
            name: 'Remove Contact Status', #Penamaan gasan permission nya
            resource: 'contact_status', #nama file di model harus sama
            action: 'destroy', #nama function di controller
            description: 'Remove Contact Status', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'lampiran_eleven_close_contact_information_contact_status_path' #path di rails route
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