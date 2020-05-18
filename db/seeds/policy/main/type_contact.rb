puts "Permission Type Contact"
permissions =[
    {
        name: 'Type Contact', #Penamaan gasan permission nya
        resource: 'main_type_contact', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Type Contact', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_type_contacts_path' #path di rails route
    },
    {
        name: 'New Type Contact', #Penamaan gasan permission nya
        resource: 'main_type_contact', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Type Contact', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_type_contact_path' #path di rails route
    },
    {
        name: 'Update Type Contact', #Penamaan gasan permission nya
        resource: 'main_type_contact', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Type Contact', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_main_type_contact_path' #path di rails route
    },
    {
        name: 'Remove Type Contact', #Penamaan gasan permission nya
        resource: 'main_type_contact', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Type Contact', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_type_contact_path' #path di rails route
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