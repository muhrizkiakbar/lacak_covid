puts "Permission Username Observer"
permissions =[
    {
        name: 'Username Observer', #Penamaan gasan permission nya
        resource: 'telegram_username_observer', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Username Observer', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_username_observers_path' #path di rails route
    },
    {
        name: 'New Username Observer', #Penamaan gasan permission nya
        resource: 'telegram_username_observer', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Username Observer', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_telegram_username_observer_path' #path di rails route
    },
    {
        name: 'Update Username Observer', #Penamaan gasan permission nya
        resource: 'telegram_username_observer', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Username Observer', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_username_observer_path' #path di rails route
    },
    {
        name: 'Remove Username Observer', #Penamaan gasan permission nya
        resource: 'telegram_username_observer', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Username Observer', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_username_observer_path' #path di rails route
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