# module Transportation 
    puts "Add Transportation"

    transportations = [
        "Kereta",
        "Bus",
        "Taxi",
        "Mobil Pribadi",
        "Angkot",
        "Transportasi Online",
        "Lain-lain"
    ]

    transportations.each do |transportation|
        add_transportation = Main::Transportation.create(
            transportation: transportation
        )
    end

# end