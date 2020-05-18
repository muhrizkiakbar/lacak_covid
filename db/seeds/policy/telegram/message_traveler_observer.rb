puts "Permission Message Traveler Observer"
permissions =[
    {
        name: 'Message Traveler Observer', #Penamaan gasan permission nya
        resource: 'telegram_message_traveler_observer', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Message Traveler Observer', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_message_traveler_observers_path' #path di rails route
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