    puts "Permission Information Expose"
    permissions =[
        {
            name: 'New Information Expose', #Penamaan gasan permission nya
            resource: 'information_expose', #nama file di model harus sama
            action: 'new', #nama function di controller
            description: 'Add Information Expose', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'new_lampiran_eleven_close_contact_information_path' #path di rails route
        },
        {
            name: 'Update Information Expose', #Penamaan gasan permission nya
            resource: 'information_expose', #nama file di model harus sama
            action: 'edit', #nama function di controller
            description: 'Update Information Expose', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'edit_lampiran_eleven_close_contact_information_path' #path di rails route
        },
        {
            name: 'Remove Information Expose', #Penamaan gasan permission nya
            resource: 'information_expose', #nama file di model harus sama
            action: 'destroy', #nama function di controller
            description: 'Remove Information Expose', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'lampiran_eleven_close_contact_information_path' #path di rails route
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