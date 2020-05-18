# module SetLocation 
    puts "Add Set Location"

    set_locations = [
        "Rumah",
        "Tempat Kerja",
        "Kelompok Tour",
        "Fasilitas Kesehatan",
        "Lainnya"
    ]

    set_locations.each do |set_location|
        add_set_location = Main::SetLocation.create(
            set_location: set_location
        )
    end
# end