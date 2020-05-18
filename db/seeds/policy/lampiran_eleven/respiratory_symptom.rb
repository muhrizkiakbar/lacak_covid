    puts "Permission Respiratory Symptom"
    permissions =[
        {
            name: 'New Respiratory Symptom', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_respiratory_symptom', #nama file di model harus sama
            action: 'new', #nama function di controller
            description: 'Add Respiratory Symptom', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'new_lampiran_eleven_close_contact_information_info_exposes_officer_respiratory_symptom_path	' #path di rails route
        },
        {
            name: 'Update Respiratory Symptom', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_respiratory_symptom', #nama file di model harus sama
            action: 'edit', #nama function di controller
            description: 'Update Respiratory Symptom', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'edit_lampiran_eleven_close_contact_information_info_exposes_officer_respiratory_symptom_path' #path di rails route
        },
        {
            name: 'Remove Respiratory Symptom', #Penamaan gasan permission nya
            resource: 'lampiran_eleven_respiratory_symptom', #nama file di model harus sama
            action: 'destroy', #nama function di controller
            description: 'Remove Respiratory Symptom', #gasan penjelasan aja
            page: false, #ini akan bisa di akses di menu atau tidak
            path: 'lampiran_eleven_close_contact_information_info_exposes_officer_respiratory_symptom_path' #path di rails route
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