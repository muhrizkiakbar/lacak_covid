# module ProvinceCityDistrictSubDistrict 
    puts "Add Province"
    provinceurl = 'https://dev.farizdotid.com/api/daerahindonesia/provinsi/63'
    #RestClient adalah plugin dengan menggunakan object RestClient untuk mengambil data dari api
    responseprovince = RestClient.get(provinceurl)
    #JSON.parse --> untuk membuat data response menjadi format JSON dan mengambil object semuaprovinsi
    jsonresponseprovince = JSON.parse(responseprovince)
    # puts jsonresponseprovince
    # jsonresponseprovince.each do |province|
    puts "===================================="
    puts jsonresponseprovince
        addprovince= Main::Province.create(province: jsonresponseprovince["nama"])

        cityurl = 'https://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=63'
        responsecity = RestClient.get(cityurl)

        jsonresponsecity = JSON.parse(responsecity)["kota_kabupaten"]

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
# end