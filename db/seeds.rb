# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require File.expand_path('../seeds/main/province_city_district_sub_district', __FILE__) 
# require File.expand_path('../seeds/main/job_type', __FILE__) 
# require File.expand_path('../seeds/main/marital_status', __FILE__) 
# require File.expand_path('../seeds/main/set_location', __FILE__) 
# require File.expand_path('../seeds/main/transportation', __FILE__) 
# require File.expand_path('../seeds/main/type_contact', __FILE__) 
# require File.expand_path('../seeds/main/dinkes_province', __FILE__) 

# require File.expand_path('../seeds/permission', __FILE__) 
# require File.expand_path('../seeds/role', __FILE__) 
# require File.expand_path('../seeds/user', __FILE__) 

# Dir[File.join(Rails.root, 'db', 'seeds/*', '*.rb')].sort.each do |seed|
#     load seed
# end

Dir[File.join(Rails.root, 'db', 'seeds/main', '*.rb')].sort.each do |seed|
    load seed
end

Dir[File.join(Rails.root, 'db', 'seeds/policy', '*.rb')].sort.each do |seed|
    load seed
end
Dir[File.join(Rails.root, 'db', 'seeds/policy/main', '*.rb')].sort.each do |seed|
    load seed
end

Dir[File.join(Rails.root, 'db', 'seeds/policy/telegram', '*.rb')].sort.each do |seed|
    load seed
end

Dir[File.join(Rails.root, 'db', 'seeds/policy/lampiran_eleven', '*.rb')].sort.each do |seed|
    load seed
end

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
    load seed
end
# Dir[File.join(Rails.root, 'db', 'seeds', 'role.rb')].sort.each do |seed|
#     load seed
# end
# Dir[File.join(Rails.root, 'db', 'seeds', 'user.rb')].sort.each do |seed|
#     load seed
# end