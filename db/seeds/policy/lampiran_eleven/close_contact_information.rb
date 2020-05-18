    puts "Permission Close Contact Information"
    permissions =[
        {
            name: 'Close Contact Information', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_close_contact_information', #nama file di model harus sama
            action: 'index', #nama function di controller
            description: 'Management Close Contact Information', #gasan penjelasan aja
            page: true, #ini akan bisa di akses di menu atau tidak
            path: 'lampiran_eleven_close_contact_informations_path' #path di rails route
        },
        {
            name: 'New Close Contact Information', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_close_contact_information', #nama file di model harus sama
            action: 'new', #nama function di controller
            description: 'Add Close Contact Information', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'new_lampiran_eleven_close_contact_information_path' #path di rails route
        },
        {
            name: 'Update Close Contact Information', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_close_contact_information', #nama file di model harus sama
            action: 'edit', #nama function di controller
            description: 'Update Close Contact Information', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'edit_lampiran_eleven_close_contact_information_path' #path di rails route
        },
        {
            name: 'Show Close Contact Information', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_close_contact_information', #nama file di model harus sama
            action: 'show', #nama function di controller
            description: 'Show Close Contact Information', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'lampiran_eleven_close_contact_information_path' #path di rails route
        },
        {
            name: 'Remove Close Contact Information', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_close_contact_information', #nama file di model harus sama
            action: 'destroy', #nama function di controller
            description: 'Remove Close Contact Information', #gasan penjelasan aja
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