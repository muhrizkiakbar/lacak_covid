puts "Permission Daily Report"
permissions =[
    {
        name: 'Daily Report', #Penamaan gasan permission nya
        resource: 'l_five_daily_report', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Daily Report', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'l_five_report_daily_path	' #path di rails route
    },
    # =================================================================
]


permissions.each_with_index do |permission,key|
    Permission.create(
        name: permission[:name], #Penamaan gasan permission nya
        resource: permission[:resource], #nama file di model harus sama
        action: permission[:action], #nama function di controller
        description: permission[:description], #gasan penjelasan aja
        page: permission[:page], #ini akan bisa di akses di menu atau tidak
        path: permission[:path] #path di rails route
    )
end
