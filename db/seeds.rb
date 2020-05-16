# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# provinceurl = 'http://dev.farizdotid.com/api/daerahindonesia/provinsi/63'
#RestClient adalah plugin dengan menggunakan object RestClient untuk mengambil data dari api
# responseprovince = RestClient.get(provinceurl)
#JSON.parse --> untuk membuat data response menjadi format JSON dan mengambil object semuaprovinsi
# jsonresponseprovince = JSON.parse(responseprovince)["provinsi"]
# puts jsonresponseprovince
# jsonresponseprovince.each do |province|

    # addprovince= Main::Province.create(province: "Kalimantan Selatan")

    # cityurl = 'https://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=63'
    # responsecity = RestClient.get(cityurl)

    # # puts province["id"]
    # # puts province["nama"]
    # jsonresponsecity = JSON.parse(responsecity)["kota_kabupaten"]

    # # puts jsonresponsecity
    # jsonresponsecity.each do |city|
    #     addcity = Main::City.new
    #     addcity.city= city["nama"]
    #     addcity.province= addprovince
    #     addcity.save
    #     idcityapi = city["id"]

    #     puts city["nama"]


    #     kecamatanurl = 'https://dev.farizdotid.com/api/daerahindonesia/kecamatan?id_kota='+idcityapi.to_s
    #     responsekecamatan = RestClient.get(kecamatanurl)
    #     jsonresponsekecamatan = JSON.parse(responsekecamatan)["kecamatan"]
    #     jsonresponsekecamatan.each do |kecamatan|
    #         addkecamatan = Main::District.new
    #         addkecamatan.district = kecamatan["nama"]
    #         addkecamatan.city= addcity
    #         addkecamatan.save
    #         idkecamatanapi = kecamatan["id"]

    #         puts kecamatan["nama"]

    #         kelurahanurl = 'https://dev.farizdotid.com/api/daerahindonesia/kelurahan?id_kecamatan='+idkecamatanapi.to_s
    #         responsekelurahan = RestClient.get(kelurahanurl)
    #         jsonresponsekelurahan = JSON.parse(responsekelurahan)["kelurahan"]
    #         jsonresponsekelurahan.each do |kelurahan|
    #             addkelurahan = Main::SubDistrict.new
    #             addkelurahan.sub_district= kelurahan["nama"]
    #             addkelurahan.district= addkecamatan
    #             addkelurahan.save

    #             puts kelurahan["nama"]
    #         end
    #     end
    # end
# end


job_types = [
    "Petugas Kesehatan",
    "Petugas Laboratorium",
    "Bekerja berhubungan dengan binatang"
    "Pelajar"
]

job_types.each do |job_type|
    add_job_type = Main::JobType.create(
        job_type: job_type
    )
end

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
    add_transportation = Main::Transportaion.create(
        transportation: transportation
    )
end

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

