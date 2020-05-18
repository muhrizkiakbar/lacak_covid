# module JobType 
    puts "Add Job Type"

    job_types = [
        "Petugas Kesehatan",
        "Petugas Laboratorium",
        "Bekerja berhubungan dengan binatang",
        "Pelajar",
        "Lainnya"
    ]

    job_types.each do |job_type|
        add_job_type = Main::JobType.create(
            job_type: job_type
        )
    end

# end