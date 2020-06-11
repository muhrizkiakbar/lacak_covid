
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



# seed for RW dan RT
city = Main::City.where(city: "Kabupaten Banjar").first

districts = Main::District.where(main_city_id: city.id)

districts.each do |district|

    sub_districts = Main::SubDistrict.where(main_district_id: district.id)

    sub_districts.each do |sub_district|

        number_citizen = 1

        50.times do 

            if (number_citizen.to_s.size == 1)
                citizen = "00"+number_citizen.to_s
            elsif (number_citizen.to_s.size == 2)
                citizen = "0"+number_citizen.to_s
            end

            citizen_assoc = Main::CitizenAssociation.new
            citizen_assoc.sub_district = sub_district
            citizen_assoc.citizen_association = citizen
            citizen_assoc.save

            number_citizen += 1

            number_neigborhood = 1

            100.times do

                if (number_neigborhood.to_s.size == 1)
                    neigborhood = "00"+number_neigborhood.to_s
                elsif (number_neigborhood.to_s.size == 2)
                    neigborhood = "0"+number_neigborhood.to_s
                elsif (number_neigborhood.to_s.size == 3)
                    neigborhood = number_neigborhood.to_s
                end
    
                neigborhood_assoc = Main::NeighborhoodAssociation.new
                neigborhood_assoc.citizen_association = citizen_assoc
                neigborhood_assoc.neighborhood_association = neigborhood
                neigborhood_assoc.save
                
                number_neigborhood += 1
            end
        end

        

    end

end