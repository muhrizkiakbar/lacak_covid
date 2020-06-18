

puts "Permission Contact Patient"
permissions =[
    {
        name: 'Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Contact Patient', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_patients_path' #path di rails route
    },
    {
        name: 'Show Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'show', #nama function di controller
        description: 'Show Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_patient_path' #path di rails route
    },
    {
        name: 'New Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'New Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_new_contact_patient_path' #path di rails route
    },
    {
        name: 'Edit Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Edit Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_edit_contact_patient_path' #path di rails route
    },
    {
        name: 'Destroy Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Destroy Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_patient_path' #path di rails route
    },
    # =================================================================
]


permissions.each_with_index do |permission,key|
    Permission.create(
        name: permission[:name], #Penamaan gasan permission nya
        resource: permission[:resource], #nama file di model harus sama
        action: permission[:action], #nama function di controller
        description: permission[:description], #gasan penjelasan aja
        page: permission[:page], #ini akan bisa di akses di menu atau tidak
        path: permission[:path] #path di rails route
    )
end
