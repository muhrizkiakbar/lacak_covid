puts "Permission Transportation"
permissions =[
    {
        name: 'Transportation', #Penamaan gasan permission nya
        resource: 'transportation', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Transportation', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'main_transportations_path' #path di rails route
    },
    {
        name: 'New Transportation', #Penamaan gasan permission nya
        resource: 'transportation', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Transportation', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_main_transportation_path' #path di rails route
    },
    {
        name: 'Update Transportation', #Penamaan gasan permission nya
        resource: 'transportation', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Transportation', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_transportation_path' #path di rails route
    },
    {
        name: 'Remove Transportation', #Penamaan gasan permission nya
        resource: 'transportation', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Transportation', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_transportation_path' #path di rails route
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