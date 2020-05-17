puts "Permission Message Report Reporter"
permissions =[
    {
        name: 'Message Report Reporter', #Penamaan gasan permission nya
        resource: 'message_report_reporter', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Management Message Report Reporter', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'telegram_message_report_reporters_path' #path di rails route
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