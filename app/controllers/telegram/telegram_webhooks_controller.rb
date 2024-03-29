class Telegram::TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  @@welcome_message_reporter = "Selamat datang RT, terimakasih telah berkontribusi dengan program Lacak Covid-19 Kalsel.\n\nSilahkan pilih ketik perintah yang anda butuhkan:\n\n/tidak_ada_temuan = Perintah ini wajib dilakukan setiap hari sebelum jam 16.00 meskipun tidak ada laporan.\n\n/suku = Untuk menampilkan kumpulan data suku.\n \n/status_pernikahan = Untuk menampilkan kumpulan data status pernikahan.\n \n(garing)lapor NOKTP#NAMA PASIEN##HARILAHIR(01)-BULANLAHIR(03)-TAHUNLAHIR(1990)#ALAMAT#NOMOR HP#NAMA ORTU#SUKU (Angka saja.)#PRIA atau WANITA#KODE STATUS PERKAWINAN(Angka saja.) = Untuk melaporkan masyarakat yang begejala. \n \n(garing)ispa (gejala) = Untuk melaporkan gejala yang dialami masyarakat yang dilaporkan.\n \n(garing)pelaku_perjalanan (tujuan) = Untuk memperbaiki kesalahan laporan gejala dialami masyarakat yang dilaporkan.\n \n(garing)kontak_erat (nama-nama pelaku kontak erat) = Untuk memperbaiki kesalahan laporan gejala dialami masyarakat yang dilaporkan.\n \n/selesai = Jika pelaporan telah selesai. \n \n \n/menu = Untuk melihat menu ini kembali. \n \n \n/bantuan = Berupa video petunjuk penggunaan. (Youtube)"
  @@welcome_message_observer = "Selamat datang Surveilance, selalu nyalakan notifikasi telegram Anda agar mendapatkan informasi dari RT. Terimakasih."

  def start!(*)    
    auth = check_username(chat["username"],chat["id"])

    if auth["status"]
      if auth["type_user"] == "reporter"
        respond_with :message, text: @@welcome_message_reporter
      else
        respond_with :message, text: @@welcome_message_observer
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def menu!(*)    
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        respond_with :message, text: @@welcome_message_reporter
      else
        respond_with :message, text: @@welcome_message_reporter
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def bantuan!(*)
    respond_with :message, text: t('.content')
  end

  def tidak_ada_temuan!(*)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"

          username_reporter = Telegram::UsernameReporter.where(username_telegram: chat["username"]).first
          username_reporter.last_activity_at = DateTime.now() 
          username_reporter.save
          respond_with :message, text: "Terimakasih telah melakukan laporan."

      else
        respond_with :message, text: 'Maaf, Anda bukan RT.'
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def status_pernikahan!(*)
    message = "Data Status Pernikahan :\n"

    marital_statuses = Main::MaritalStatus.all

    marital_statuses.each do |marital_status|
      message = message + marital_status.id.to_s + ". " + marital_status.marital_status + "\n" 
    end

    respond_with :message, text: message + "\n/menu = Untuk kembali ke menu."

  end

  def lapor!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        @failed_message = "Mohon Input Laporan Pasien Dengan Format Berikut : (garing)lapor NOKTP#NAMA PASIEN##HARILAHIR(01)-BULANLAHIR(03)-TAHUNLAHIR(1990)#ALAMAT#NOMOR HP#NAMA ORTU#SUKU (Angka saja.)#PRIA atau WANITA#KODE STATUS PERKAWINAN(Angka saja.)"
        if args.any?

          data_patient_delimited = validate_patient_delimiter(args.join(' '))

          if data_patient_delimited.length == 9
            if (data_patient_delimited[0].to_i).to_s.length == 16
              if validate_marital_status(data_patient_delimited[8])

                  session[:data_patient] = args.join(' ')
                  respond_with :message, text: "Berhasil. Silahkan melakukan laporan ISPA / Pelaku Perjalanan / Kontak Erat."

              else
                respond_with :message, text: @failed_message
              end
            else
              respond_with :message, text: 'Format No. KTP tidak valid.'
            end

          else
            respond_with :message, text: @failed_message
          end

        else
          respond_with :message, text: @failed_message
          save_context :data_patient!
        end
      else
        respond_with :message, text: 'Maaf, Anda bukan RT.' 
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
    
  end

  def ispa!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        if args.any?
          session[:data_ispa] = args.join(' ')
          respond_with :message, text: "Berhasil melaporkan ISPA. Silahkan tuliskan perintah /selesai apabila tidak ada lagi data yang dilaporkan."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan ISPA dengan format berikut (garing)ispa (gejala)"
          save_context :data_ispa!
        end
      else
        respond_with :message, text: 'Maaf, Anda bukan RT.'
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
    
  end

  def pelaku_perjalanan!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        if args.any?
          session[:data_traveler] = args.join(' ')
          respond_with :message, text: "Berhasil melaporkan Pelaku Perjalanan. Silahkan tuliskan perintah /selesai apabila tidak ada lagi data yang dilaporkan."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan Pelaku Perjalanan dengan format berikut (garing)pelaku_perjalanan (tujuan)"
          save_context :data_traveler!
        end
      else
        respond_with :message, text: 'Maaf, Anda bukan RT.'
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def kontak_erat!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        if args.any?
          session[:data_closecontact] = args.join(' ')
          respond_with :message, text: "Berhasil melaporkan Kontak Erat. Silahkan tuliskan perintah /selesai apabila tidak ada lagi data yang dilaporkan."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan Kontak Erat dengan format berikut (garing)kontak_erat (nama-nama pelaku kontak erat)"
          save_context :data_closecontact!
        end
      else
        respond_with :message, text: 'Maaf, Anda bukan RT.'
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def selesai!(*)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        if (!session[:data_patient].nil?) && ( (!session[:data_ispa].nil?) || (!session[:data_traveler].nil?) || (!session[:data_closecontact].nil?) )

          save_data_report(session[:data_patient],session[:data_ispa],session[:data_traveler],session[:data_closecontact],chat["id"],chat["username"])
          respond_with :message, text: 'Data telah disimpan'
        else
          if ( (session[:data_ispa].nil?) || (session[:data_traveler].nil?) || (session[:data_closecontact].nil?) )
            respond_with :message, text: 'Anda belum melaporkan salah satu jenis laporan ISPA / Pelaku Perjalanan / Kontak Erat. /menu untuk melihat format penulisan'
          end
          if session[:data_patient].nil?
            respond_with :message, text: 'Anda belum melaporkan data masyarakat. Silahkan ketikan perintah berikut:\n(garing)lapor (garing)lapor NOKTP#NAMA PASIEN##HARILAHIR(01)-BULANLAHIR(03)-TAHUNLAHIR(1990)#ALAMAT#NOMOR HP#NAMA ORTU#SUKU (Angka saja.)#PRIA atau WANITA#KODE STATUS PERKAWINAN(Angka saja.)'
          end
        end
      else
        respond_with :message, text: 'Maaf, Anda bukan RT.'
      end
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end

  end

  def callback_query(data)
    if data == 'alert'
      answer_callback_query t('.alert'), show_alert: true
    else
      answer_callback_query t('.no_alert')
    end
  end

  def message(message)
    respond_with :message, text: "Format salah."
  end

  def inline_query(query, _offset)
    query = query.first(10) # it's just an example, don't use large queries.
    t_description = t('.description')
    t_content = t('.content')
    results = Array.new(5) do |i|
      {
        type: :article,
        title: "#{query}-#{i}",
        id: "#{query}-#{i}",
        description: "#{t_description} #{i}",
        input_message_content: {
          message_text: "#{t_content} #{i}",
        },
      }
    end
    answer_inline_query results
  end

  # As there is no chat id in such requests, we can not respond instantly.
  # So we just save the result_id, and it's available then with `/last_chosen_inline_result`.
  def chosen_inline_result(result_id, _query)
    session[:last_chosen_inline_result] = result_id
  end

  def last_chosen_inline_result!(*)
    result_id = session[:last_chosen_inline_result]
    if result_id
      respond_with :message, text: t('.selected', result_id: result_id)
    else
      respond_with :message, text: t('.prompt')
    end
  end

  def action_missing(action, *_args)
    if action_type == :command
      respond_with :message,
        text: "Perintah tidak ada."
    else
      respond_with :message, text: "Fitur ini tidak ada."
    end
  end

  private

  def check_username(username,chat_id)
    username_rt = Telegram::UsernameReporter.where('username_telegram = ?', username).first
    username_surveilance = nil
    type_user = nil

    if !username_rt.nil?
      username_rt = username_rt
      type_user = "reporter"
    else
      username_surveilance = Telegram::UsernameObserver.where('username_telegram = ?', username).first
      username_rt = nil
      type_user = "observer"

      if !username_surveilance.nil?
        username_surveilance = username_surveilance
      end
    end

    status = false
    if (username_rt == nil) && (username_surveilance == nil) 
      status = false
    else
      check_chat(username,chat_id,type_user)
      status = true
    end

    result = { "type_user" => type_user, "status" => status }
    return result
  end

  def validate_patient_delimiter(value)
    has_value_split = value.split("#")
  end

  def validate_marital_status(marital_status)
    marital_status = Main::MaritalStatus.where(id: marital_status).first
    if marital_status
      return true
    else
      return false
    end
  end

  def check_no_id_patient(no_id)
    patient = Main::Patient.where(no_identity: no_id).first
    if patient
      return false
    else
      return true
    end
  end

  def save_data_report(data_patient,data_ispa = nil,data_traveler = nil,data_closecontact=nil,chat_id,username)
    data_patient_delimited = validate_patient_delimiter(data_patient)

    # save data patient
    if check_no_id_patient(data_patient_delimited[0])


      marital_status = Main::MaritalStatus.where(id: data_patient_delimited[8]).first
      username_reporter = Telegram::UsernameReporter.where(username_telegram: username).first
      username_reporter.last_activity_at = DateTime.now()

      add_patient = Main::Patient.new
      add_patient.city = username_reporter.city
      add_patient.district = username_reporter.district
      add_patient.sub_district = username_reporter.sub_district
      add_patient.citizen_association = username_reporter.citizen_association
      add_patient.neighborhood_association = username_reporter.neighborhood_association
      add_patient.marital_status = marital_status
      add_patient.no_identity = data_patient_delimited[0]
      add_patient.name = data_patient_delimited[1]
      add_patient.name_of_parent = data_patient_delimited[5]
      add_patient.address = data_patient_delimited[3]
      add_patient.phone_number = data_patient_delimited[4]
      add_patient.date_of_birth = data_patient_delimited[2]
      if data_patient_delimited[7].downcase=="pria"
        gender = "male"
      else
        gender = "female"
      end
      add_patient.gender = gender
      add_patient.marital_status = marital_status
      add_patient.save

      puts "=======Add Patient"
      puts add_patient.errors.full_messages

      add_message_report_reporter = Telegram::MessageReportReporter.new
      add_message_report_reporter.chat_id = chat_id
      add_message_report_reporter.username_reporter = username_reporter
      add_message_report_reporter.username_telegram = username_reporter.username_telegram
      add_message_report_reporter.message = data_patient
      add_message_report_reporter.save

      puts "=======add_message_report_reporter"
      puts add_message_report_reporter.errors.full_messages

      if !data_ispa.nil?
        add_messsage_ili_reporter = Telegram::MessageIliReporter.new
        add_messsage_ili_reporter.username_reporter = username_reporter
        add_messsage_ili_reporter.chat_id = chat_id
        add_messsage_ili_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_ili_reporter.message = data_ispa
        add_messsage_ili_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_ili_reporter.errors.full_messages
      end 

      if !data_traveler.nil?
        add_messsage_traveler_reporter = Telegram::MessageTravelerReporter.new
        add_messsage_traveler_reporter.username_reporter = username_reporter
        add_messsage_traveler_reporter.chat_id = chat_id
        add_messsage_traveler_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_traveler_reporter.message = data_traveler
        add_messsage_traveler_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_traveler_reporter.errors.full_messages
      end

      if !data_closecontact.nil?
        add_messsage_closecont_reporter = Telegram::MessageClosecontReporter.new
        add_messsage_closecont_reporter.username_reporter = username_reporter
        add_messsage_closecont_reporter.chat_id = chat_id
        add_messsage_closecont_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_closecont_reporter.message = data_closecontact
        add_messsage_closecont_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_closecont_reporter.errors.full_messages
      end

      public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: username_reporter.sub_district.id).first

      username_observers = Telegram::UsernameObserver.where(main_public_health_center_id: public_health_center.id)

      username_observers.each do |username_observer|
        chat_observer = Telegram::ChatObserver.where(telegram_username_observer_id: username_observer.id).first
        chat_reporter = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id)

        data_warga = "Data warga : \n" + "No KTP : " + data_patient_delimited[0] + "\nNama : "+data_patient_delimited[1] + "\nTanggal Lahir : " + data_patient_delimited[2] + "\nAlamat : " + data_patient_delimited[3] + "\nNo. HP : " + data_patient_delimited[4] + "\nNama Ortu : " + data_patient_delimited[5] + "\nJenis Kelamin : " + data_patient_delimited[7]
        data_pelapor = "Nama : "+username_reporter.name+"\nKelurahan : "+username_reporter.sub_district.sub_district+"\nRW : "+username_reporter.citizen_association.citizen_association+"\nRT : "+username_reporter.neighborhood_association.neighborhood_association

        begin
          Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga + "\n \nPelapor : \n"+data_pelapor)
          puts "=========================kirim pesan"
          puts chat_observer.username_observer.username_telegram
          puts chat_observer.chat_id


          add_message_report_observer = Telegram::MessageReportObserver.new
          add_message_report_observer.chat_id = chat_id
          add_message_report_observer.username_observer = username_observer
          add_message_report_observer.username_telegram = username_observer.username_telegram
          add_message_report_observer.message = data_patient
          add_message_report_observer.save

          puts "=======add_message_report_observer"
          puts add_message_report_observer.errors.full_messages

          if !data_ispa.nil?
            add_messsage_ili_observer = Telegram::MessageIliObserver.new
            add_messsage_ili_observer.username_observer = username_observer
            add_messsage_ili_observer.chat_id = chat_id
            add_messsage_ili_observer.username_telegram = username_observer.username_telegram
            add_messsage_ili_observer.message = data_ispa
            add_messsage_ili_observer.save

            Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga+"\n \nData ispa : "+data_ispa+"\n \nPelapor : \n"+data_pelapor)

            puts "=======add_messsage_ili_observer"
            puts add_messsage_ili_observer.errors.full_messages
          end

          if !data_traveler.nil?
            add_messsage_traveler_observer = Telegram::MessageTravelerObserver.new
            add_messsage_traveler_observer.username_observer = username_observer
            add_messsage_traveler_observer.chat_id = chat_id
            add_messsage_traveler_observer.username_telegram = username_observer.username_telegram
            add_messsage_traveler_observer.message = data_traveler
            add_messsage_traveler_observer.save
    
            Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga+"\n \nTujuan : "+data_traveler+"\n \nPelapor : \n"+data_pelapor)
    
            puts "=======add_messsage_ili_reporter"
            puts add_messsage_traveler_observer.errors.full_messages
          end
    
          if !data_closecontact.nil?
            add_messsage_closecont_observer = Telegram::MessageClosecontObserver.new
            add_messsage_closecont_observer.username_observer = username_observer
            add_messsage_closecont_observer.chat_id = chat_id
            add_messsage_closecont_observer.username_telegram = username_observer.username_telegram
            add_messsage_closecont_observer.message = data_closecontact
            add_messsage_closecont_observer.save
    
            Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga+"\n \nNama pelaku kontak erat: "+data_closecontact+"\n \nPelapor : \n"+data_pelapor)

            puts "=======add_messsage_ili_reporter"
            puts add_messsage_closecont_observer.errors.full_messages
          end


        rescue Telegram::Bot::Forbidden
          puts "=========================Gagal"
          puts "Gagal kirim"
        end
        la_username_observer = Telegram::UsernameObserver.where(id: username_observer.id).first

        username_reporter.last_activity_at = DateTime.now()
        username_reporter.save

        session.delete(:data_patient)
        session.delete(:data_ispa)
        session.delete(:data_traveler)
        session.delete(:data_closecontact)

      end
    
    #### data patient sudah ada
    else
      
      marital_status = Main::MaritalStatus.where(id: data_patient_delimited[8]).first
      username_reporter = Telegram::UsernameReporter.where(username_telegram: username).first
      username_reporter.last_activity_at = DateTime.now()

      add_patient = Main::Patient.where(no_identity: data_patient_delimited[0]).first
      add_patient.city = username_reporter.city
      add_patient.district = username_reporter.district
      add_patient.sub_district = username_reporter.sub_district
      add_patient.citizen_association = username_reporter.citizen_association
      add_patient.neighborhood_association = username_reporter.neighborhood_association
      add_patient.marital_status = marital_status
      add_patient.no_identity = data_patient_delimited[0]
      add_patient.name = data_patient_delimited[1]
      add_patient.name_of_parent = data_patient_delimited[5]
      add_patient.address = data_patient_delimited[3]
      add_patient.phone_number = data_patient_delimited[4]
      add_patient.date_of_birth = data_patient_delimited[2]
      if data_patient_delimited[7].downcase=="pria"
        gender = "male"
      else
        gender = "female"
      end
      add_patient.gender = gender
      add_patient.marital_status = marital_status
      add_patient.save

      puts "=======Add Patient"
      puts add_patient.errors.full_messages

      add_message_report_reporter = Telegram::MessageReportReporter.new
      add_message_report_reporter.chat_id = chat_id
      add_message_report_reporter.username_reporter = username_reporter
      add_message_report_reporter.username_telegram = username_reporter.username_telegram
      add_message_report_reporter.message = data_patient
      add_message_report_reporter.save

      puts "=======add_message_report_reporter"
      puts add_message_report_reporter.errors.full_messages

      if !data_ispa.nil?
        add_messsage_ili_reporter = Telegram::MessageIliReporter.new
        add_messsage_ili_reporter.username_reporter = username_reporter
        add_messsage_ili_reporter.chat_id = chat_id
        add_messsage_ili_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_ili_reporter.message = data_ispa
        add_messsage_ili_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_ili_reporter.errors.full_messages
      end 

      if !data_traveler.nil?
        add_messsage_traveler_reporter = Telegram::MessageTravelerReporter.new
        add_messsage_traveler_reporter.username_reporter = username_reporter
        add_messsage_traveler_reporter.chat_id = chat_id
        add_messsage_traveler_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_traveler_reporter.message = data_traveler
        add_messsage_traveler_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_traveler_reporter.errors.full_messages
      end

      if !data_closecontact.nil?
        add_messsage_closecont_reporter = Telegram::MessageClosecontReporter.new
        add_messsage_closecont_reporter.username_reporter = username_reporter
        add_messsage_closecont_reporter.chat_id = chat_id
        add_messsage_closecont_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_closecont_reporter.message = data_closecontact
        add_messsage_closecont_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_closecont_reporter.errors.full_messages
      end

      public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: username_reporter.sub_district.id).first

      username_observers = Telegram::UsernameObserver.where(main_public_health_center_id: public_health_center.id)

      data_warga = "Data warga : \n" + "No KTP : " + data_patient_delimited[0] + "\nNama : "+data_patient_delimited[1] + "\nTanggal Lahir : " + data_patient_delimited[2] + "\nAlamat : " + data_patient_delimited[3] + "\nNo. HP : " + data_patient_delimited[4] + "\nNama Ortu : " + data_patient_delimited[5] + "\nJenis Kelamin : " + data_patient_delimited[7]
      data_pelapor = "Nama : "+username_reporter.name+"\nKelurahan : "+username_reporter.sub_district.sub_district+"\nRW : "+username_reporter.citizen_association.citizen_association+"\nRT : "+username_reporter.neighborhood_association.neighborhood_association

      username_observers.each do |username_observer|
        chat_observer = Telegram::ChatObserver.where(telegram_username_observer_id: username_observer.id).first
        chat_reporter = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id)

        begin
          Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga + "\n \nPelapor : \n"+data_pelapor)
          puts "=========================kirim pesan"
          puts chat_observer.username_observer.username_telegram
          puts chat_observer.chat_id


          add_message_report_observer = Telegram::MessageReportObserver.new
          add_message_report_observer.chat_id = chat_id
          add_message_report_observer.username_observer = username_observer
          add_message_report_observer.username_telegram = username_observer.username_telegram
          add_message_report_observer.message = data_patient
          add_message_report_observer.save

          puts "=======add_message_report_observer"
          puts add_message_report_observer.errors.full_messages

          if !data_ispa.nil?
            add_messsage_ili_observer = Telegram::MessageIliObserver.new
            add_messsage_ili_observer.username_observer = username_observer
            add_messsage_ili_observer.chat_id = chat_id
            add_messsage_ili_observer.username_telegram = username_observer.username_telegram
            add_messsage_ili_observer.message = data_ispa
            add_messsage_ili_observer.save

            Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga+"\n \nData ispa : "+data_ispa+"\n \nPelapor : \n"+data_pelapor)

            puts "=======add_messsage_ili_observer"
            puts add_messsage_ili_observer.errors.full_messages
          end

          if !data_traveler.nil?
            add_messsage_traveler_observer = Telegram::MessageTravelerObserver.new
            add_messsage_traveler_observer.username_reporter = username_observer
            add_messsage_traveler_observer.chat_id = chat_id
            add_messsage_traveler_observer.username_telegram = username_observer.username_telegram
            add_messsage_traveler_observer.message = data_traveler
            add_messsage_traveler_observer.save
    
            Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga+"\n \nTujuan : "+data_traveler+"\n \nPelapor : \n"+data_pelapor)
    
            puts "=======add_messsage_ili_reporter"
            puts add_messsage_traveler_observer.errors.full_messages
          end
    
          if !data_closecontact.nil?
            add_messsage_closecont_observer = Telegram::MessageClosecontObserver.new
            add_messsage_closecont_observer.username_observer = username_observer
            add_messsage_closecont_observer.chat_id = chat_id
            add_messsage_closecont_observer.username_telegram = username_observer.username_telegram
            add_messsage_closecont_observer.message = data_closecontact
            add_messsage_closecont_observer.save
    
            Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_warga+"\n \nNama pelaku kontak erat: "+data_closecontact+"\n \nPelapor : \n"+data_pelapor)

            puts "=======add_messsage_ili_reporter"
            puts add_messsage_closecont_observer.errors.full_messages
          end


        rescue Telegram::Bot::Forbidden
          puts "=========================Gagal"
          puts "Gagal kirim"
        end
        la_username_observer = Telegram::UsernameObserver.where(id: username_observer.id).first

        username_reporter.last_activity_at = DateTime.now()
        username_reporter.save

        session.delete(:data_patient)
        session.delete(:data_ispa)
        session.delete(:data_traveler)
        session.delete(:data_closecontact)

      end
    end
  end

  def check_chat(username,chat_id,type_user)
    
    if type_user=="reporter"
      username_reporter = username_rt = Telegram::UsernameReporter.where('username_telegram = ?', username).first
      
      check_chat = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id)


      if check_chat.count > 1
        check_chat.destroy_all
      else
        if check_chat.first.nil?
          add_check_chat = Telegram::ChatReporter.new
          add_check_chat.username_reporter = username_reporter
          add_check_chat.chat_id = chat_id
          add_check_chat.save
        else
          check_chat = check_chat.first
          check_chat.chat_id = chat_id
          check_chat.save
        end
      end


    else
      username_observer = Telegram::UsernameObserver.where('username_telegram = ?', username).first

      check_chat = Telegram::ChatObserver.where(telegram_username_observer_id: username_observer.id)

      if check_chat.count > 1
        check_chat.destroy_all
      else
        if check_chat.first.nil?
          add_check_chat = Telegram::ChatObserver.new
          add_check_chat.username_observer = username_observer
          add_check_chat.chat_id = chat_id
          add_check_chat.save
        else
          check_chat = check_chat.first
          check_chat.chat_id = chat_id
          check_chat.save
        end
      end
    end
  end
end
