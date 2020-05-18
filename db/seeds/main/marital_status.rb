# module MaritalStatus 
    puts "Add Marital Status"

    marital_statuses = [
        "Belum Menikah",
        "Menikah",
        "Duda",
        "Janda"
    ]

    marital_statuses.each do |marital_status|
        add = Main::MaritalStatus.create(
            marital_status: marital_status
        )
    end 
# end
