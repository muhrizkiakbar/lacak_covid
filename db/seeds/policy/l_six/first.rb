puts "Permission Patient Identity"
permissions =[
    {
        name: 'Patient Identities', #Penamaan gasan permission nya
        resource: 'l_six_first', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Pasien ', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'l_six_firsts_path' #path di rails route
    },
    {
        name: 'New Patient Identity', #Penamaan gasan permission nya
        resource: 'l_six_first', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Patient Identity', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_l_six_first_path' #path di rails route
    },
    {
        name: 'Update Patient Identity', #Penamaan gasan permission nya
        resource: 'l_six_first', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Update Patient Identity', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_l_six_first_path' #path di rails route
    },
    {
        name: 'Show Patient Identity', #Penamaan gasan permission nya
        resource: 'l_six_first', #nama file di model harus sama
        action: 'show', #nama function di controller
        description: 'Show Patient Identity', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_six_first_path' #path di rails route
    },
    {
        name: 'Remove Patient Identity', #Penamaan gasan permission nya
        resource: 'l_six_first', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Patient Identity', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_six_first_path' #path di rails route
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