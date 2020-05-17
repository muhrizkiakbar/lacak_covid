# module DinkesProvince 
    puts "Add Dinkes Province"

    dinkes_provinces = [
        "Dinas Kesehatan Provinsi Kalimantan Selatan"
    ]

    dinkes_provinces.each do |dinkes_province|
        add = Main::DinkesProvince.create(
            dinkes_province: dinkes_province
        )
    end
# end