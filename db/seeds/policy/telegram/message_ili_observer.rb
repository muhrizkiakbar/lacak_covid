puts "Permission Message ILI Observer"
permissions =[
    {
        name: 'Message  ILI Observer', #Penamaan gasan permission nya
        resource: 'telegram_message_ili_observer', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management ILI Observer', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_message_ili_observers_path' #path di rails route
    }
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