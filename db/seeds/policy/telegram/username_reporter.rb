puts "Permission Username Reporter"
permissions =[
    {
        name: 'Username Reporter', #Penamaan gasan permission nya
        resource: 'telegram_username_reporter', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Username Reporter', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_username_reporters_path' #path di rails route
    },
    {
        name: 'New Username Reporter', #Penamaan gasan permission nya
        resource: 'telegram_username_reporter', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'Add Username Reporter', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'new_telegram_username_reporter_path' #path di rails route
    },
    {
        name: 'Update Username Reporter', #Penamaan gasan permission nya
        resource: 'telegram_username_reporter', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Change Username Reporter', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'edit_telegram_username_reporter_path' #path di rails route
    },
    {
        name: 'Remove Username Reporter', #Penamaan gasan permission nya
        resource: 'telegram_username_reporter', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Remove Username Reporter', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_username_reporter_path' #path di rails route
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