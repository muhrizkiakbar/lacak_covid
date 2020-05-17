puts "Permission Message Close Contact Reporter"
permissions =[
    {
        name: 'Message Close Contact Reporter', #Penamaan gasan permission nya
        resource: 'message_closecont_reporter', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Close Contact Reporter', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_message_closecont_reporters_path' #path di rails route
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