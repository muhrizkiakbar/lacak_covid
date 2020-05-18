puts "Permission Patient"
permissions =[
    {
        name: 'Patient', #Penamaan gasan permission nya
        resource: 'main_patient', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Patient', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_patients_path' #path di rails route
    },
    {
        name: 'New Patient', #Penamaan gasan permission nya
        resource: 'main_patient', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_patient_path' #path di rails route
    },
    {
        name: 'Update Patient', #Penamaan gasan permission nya
        resource: 'main_patient', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_patient_path' #path di rails route
    },
    {
        name: 'Remove Patient', #Penamaan gasan permission nya
        resource: 'main_patient', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_patient_path' #path di rails route
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