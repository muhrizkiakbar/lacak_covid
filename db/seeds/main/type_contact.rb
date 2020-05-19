# module TypeContact 
    puts "Add Type Contact"

    type_contacts = [
        "Kontak Serumah",
        "Petugas Kesehatan",
        "Lainnya"
    ]

    type_contacts.each do |type|
        add = Main::TypeContact.create(
            type_contact: type
        )
    end
# end