
# Dir[File.join(Rails.root, 'db', 'seeds/main', '*.rb')].sort.each do |seed|
#     load seed
# end

# Dir[File.join(Rails.root, 'db', 'seeds/policy', '*.rb')].sort.each do |seed|
#     load seed
# end
# Dir[File.join(Rails.root, 'db', 'seeds/policy/main', '*.rb')].sort.each do |seed|
#     load seed
# end

# Dir[File.join(Rails.root, 'db', 'seeds/policy/telegram', '*.rb')].sort.each do |seed|
#     load seed
# end

# Dir[File.join(Rails.root, 'db', 'seeds/policy/lampiran_eleven', '*.rb')].sort.each do |seed|
#     load seed
# end


# Dir[File.join(Rails.root, 'db', 'seeds/policy/l_five', '*.rb')].sort.each do |seed|
#     load seed
# end

# Dir[File.join(Rails.root, 'db', 'seeds/policy/l_six', '*.rb')].sort.each do |seed|
#     load seed
# end

# Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
#     load seed
# end
# Dir[File.join(Rails.root, 'db', 'seeds', 'role.rb')].sort.each do |seed|
#     load seed
# end
# Dir[File.join(Rails.root, 'db', 'seeds', 'user.rb')].sort.each do |seed|
#     load seed
# end


puts "Permission Contact List"
permissions =[
    {
        name: 'Contact List', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_list', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Contact List', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_lists_path' #path di rails route
    },
    {
        name: 'Show Contact List', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_list', #nama file di model harus sama
        action: 'show', #nama function di controller
        description: 'Show Contact List', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_list_path' #path di rails route
    },
    {
        name: 'New Contact List', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_list', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'New Contact List', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_new_contact_list_path' #path di rails route
    },
    {
        name: 'Edit Contact List', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_list', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Edit Contact List', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_edit_contact_list_path' #path di rails route
    },
    {
        name: 'Destroy Contact List', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_list', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Destroy Contact List', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_list_path' #path di rails route
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



puts "Permission Contact Patient"
permissions =[
    {
        name: 'Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'index', #nama function di controller
        description: 'Contact Patient', #gasan penjelasan aja
        page: true, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_patients_path' #path di rails route
    },
    {
        name: 'Show Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'show', #nama function di controller
        description: 'Show Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_patient_path' #path di rails route
    },
    {
        name: 'New Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'new', #nama function di controller
        description: 'New Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_new_contact_patient_path' #path di rails route
    },
    {
        name: 'Edit Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'edit', #nama function di controller
        description: 'Edit Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_edit_contact_patient_path' #path di rails route
    },
    {
        name: 'Destroy Contact Patient', #Penamaan gasan permission nya
        resource: 'l_contact_list_contact_patient', #nama file di model harus sama
        action: 'destroy', #nama function di controller
        description: 'Destroy Contact Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'l_contact_list_contact_patient_path' #path di rails route
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

# seed for RW dan RT
#city = Main::City.where(city: "Kabupaten Banjar").first
#
#districts = Main::District.where(main_city_id: city.id)
#
#districts.each do |district|
#
#    sub_districts = Main::SubDistrict.where(main_district_id: district.id)
#
#    sub_districts.each do |sub_district|
#
#        number_citizen = 1
#
#        50.times do 
#
#            if (number_citizen.to_s.size == 1)
#                citizen = "00"+number_citizen.to_s
#            elsif (number_citizen.to_s.size == 2)
#                citizen = "0"+number_citizen.to_s
#            end
#
#            citizen_assoc = Main::CitizenAssociation.new
#            citizen_assoc.sub_district = sub_district
#            citizen_assoc.citizen_association = citizen
#            citizen_assoc.save
#
#            puts "RW " + citizen.to_s
#
#            number_citizen += 1
#
#            number_neigborhood = 1
#
#            100.times do
#
#                if (number_neigborhood.to_s.size == 1)
#                    neigborhood = "00"+number_neigborhood.to_s
#                elsif (number_neigborhood.to_s.size == 2)
#                    neigborhood = "0"+number_neigborhood.to_s
#                elsif (number_neigborhood.to_s.size == 3)
#                    neigborhood = number_neigborhood.to_s
#                end
#                
#                # puts "RT " + neigborhood.to_s
#
#                neigborhood_assoc = Main::NeighborhoodAssociation.new
#                neigborhood_assoc.citizen_association = citizen_assoc
#                neigborhood_assoc.neighborhood_association = neigborhood
#                neigborhood_assoc.save
#                
#                number_neigborhood += 1
#            end
#        end
#
#        
#
#    end
#
#end
