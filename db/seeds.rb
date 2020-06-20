
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


puts "Show Patient"
permissions =[
    {
        name: 'Show Patient', #Penamaan gasan permission nya
        resource: 'main_patient', #nama file di model harus sama
        action: 'show', #nama function di controller
        description: 'Show Patient', #gasan penjelasan aja
        page: false, #ini akan bisa di akses di menu atau tidak
        path: 'main_patient_path' #path di rails route
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
