
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

puts "Croscheck user"
users = User.only_deleted.order("created_at asc").all

users.each_with_index do |user,key|
    checkuser = User.where(email: user.email).only_deleted.count
    # if checkuser > 1

        update = User.find(user.id)
        update.email = update.email.to_s + key.to_s
        update.username = update.username.to_s + key.to_s
        update.save
    # end
end

Dir[File.join(Rails.root, 'db', 'seeds/policy/l_five', '*.rb')].sort.each do |seed|
    load seed
end

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

