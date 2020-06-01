class Telegram::TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  @@welcome_message_reporter = "Selamat datang RT, terimakasih telah berkontribusi dengan program Lacak Covid-19 Kalsel.\n\nSaya adalah BOT yang dibuat untuk menerima laporan Warga yang mengalami Gejala Klinis, Pelaku Perjalanan atau Kontak Erat di wilayah RT Anda.\n\nUntuk melihat bagaimana cara melapor, silahkan ketik perintah : \n/caralapor\n\nJika Anda butuh bantuan, silahkan ketika perintah :\n/bantuan\n\n*Anda akan mendapatkan Notifikasi apabila anda tidak melapor sebelum jam 16:00."
  @@welcome_message_observer = "Selamat datang Surveilance, selalu nyalakan notifikasi telegram Anda agar mendapatkan informasi dari RT. Terimakasih."
  @@how_to_report = "\nCara Lapor :\n\n1. Lapor Data Diri Warga, silahkan ketik perintah :\n\n'/lapor(SPASI)NOMORKTP#NAMALENGKAP#TANGGALLAHIR#ALAMATKTP#ALAMATDOMISILI#NOMORHP#NAMAORTU#JENISKELAMIN#STATUSPERKAWINAN' (tanpa tanda petik)\n\nPenulisan : \nNOMORKTP : Sesuai Nomor KTP.\nNAMALENGKAP : Sesuai Nama Lengkap KTP.\nTANGGALLAHIR : Sesuai Tanggal Lahir KTP, Tanggal-Bulan-Tahun (12-12-2020).\nALAMATKTP : Sesuai Alamat di KTP.\nALAMATDOMISILI : Sesuai Alamat Domisili saat ini, diisi 'SAMA' (tanpa petik) apabila sama dengan Alamat KTP\nNOMORHP : Nomor HP/Telepon yang masih aktif saat ini.\nNAMAORTU : Nama orang tua sesuai KK.\nJENISKELAMIN : Diisi 'PRIA' atau 'WANITA' (tanpa petik).\nSTATUSPERKAWINAN : Isikan Kode Angka Saja\n  1) Belum Menikah\n  2) Menikah\n  3) Duda\n  4) Janda\n\nCONTOH :\n/lapor 6372061212200002#Dodo Sudodo#12-12-2020#Jl. Jambu No. 4#Jl. Duta No. 22#081233002929#Sudodo#PRIA#2\n\n2. Lapor status Warga :\na. Bergejala Klinis, silahkan ketik perintah :\n\n'/ispa(SPASI)Gejala yang dialami warga' (tanpa tanda petik)\n\nCONTOH :\n/ispa batuk, pilek, sesak nafas\n\nb. Pelaku Perjalanan\n\n'/pelaku_perjalanan(SPASI)Kota Tujuan Perjalanan' (tanpa tanda petik)\n\nCONTOH :\n/pelaku_perjalanan Banjarmasin, Surabaya, Jakarta\n\nc. Kontak Erat\n\n'/kontak_erat(SPASI)Nama Yang Kontak Erat Dengan Pelaku' (tanpa tanda petik)\n\nCONTOH :\n/kontak_erat Doni, Ardi, Budi, Nita\n\n3. Ketik perintah '/selesai' (tanpa petik), untuk mengakhiri laporan.\n\nCONTOH :\n/selesai\n\n4. Ketik perintah '/tidak_ada_temuan' (tanpa petik), apabila dalam 24 jam tidak ada Warga anda yang dilaporkan.\n\nCONTOH:\n/tidak_ada_temuan"

  def start!(*)    
    auth = check_username(chat["username"],chat["id"])
    puts "========"
    puts payload["message_id"]
    
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


  # def menu!(*)    
  #   auth = check_username(chat["username"],chat["id"])
  #   if auth["status"]
  #     if auth["type_user"] == "reporter"
  #       respond_with :message, text: @@welcome_message_reporter
  #     else
  #       respond_with :message, text: @@welcome_message_observer
  #     end
      
  #   else
  #     respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
  #   end
  # end

  def caralapor!(*)    
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        respond_with :message, text: @@how_to_report
      else
        respond_with :message, text: @@welcome_message_observer
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def bantuan!(*)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        respond_with :message, text: t('.content')
      else
        respond_with :message, text: t('.content')
      end
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
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
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
        message = "Data Status Pernikahan :\n"

        marital_statuses = Main::MaritalStatus.all

        marital_statuses.each do |marital_status|
          message = message + marital_status.id.to_s + ". " + marital_status.marital_status + "\n" 
        end

        respond_with :message, text: message + "\n/menu = Untuk kembali ke menu."
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def lapor!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        @failed_message = "Mohon Input Laporan Pasien Dengan Format Berikut : (garing)lapor NOKTP#NAMA PASIEN##HARILAHIR(01)-BULANLAHIR(03)-TAHUNLAHIR(1990)#ALAMAT KTP#ALAMAT DOMISILI#NOMOR HP#NAMA ORTU#PRIA atau WANITA#KODE STATUS PERKAWINAN(Angka saja.)"
        if args.any?

          data_patient_delimited = validate_patient_delimiter(args.join(' '))

          if data_patient_delimited.length == 9
            if (data_patient_delimited[0].to_i).to_s.length == 16
              if validate_marital_status(data_patient_delimited[8])

                  session[:data_patient] = args.join(' ')
                  session[:data_patient_message_id] = payload["message_id"]
                  respond_with :message, text: "Berhasil. Silahkan melakukan laporan : \n\n(garing)ispa (gejala) = Untuk melaporkan gejala yang dialami masyarakat yang dilaporkan. \n\n(garing)pelaku_perjalanan (tujuan) = Untuk memperbaiki kesalahan laporan gejala dialami masyarakat yang dilaporkan.\n\n(garing)kontak_erat (nama-nama pelaku kontak erat) = Untuk memperbaiki kesalahan laporan gejala dialami masyarakat yang dilaporkan."

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
          save_context :data_patient_message_id!
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
          session[:data_ispa_message_id] = payload["message_id"]
          respond_with :message, text: "Berhasil melaporkan ISPA. Silahkan tuliskan perintah /selesai apabila tidak ada lagi data yang dilaporkan."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan ISPA dengan format berikut (garing)ispa (gejala)"
          save_context :data_ispa!
          save_context :data_ispa_message_id!
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
          session[:data_traveler_message_id] = payload["message_id"]
          respond_with :message, text: "Berhasil melaporkan Pelaku Perjalanan. Silahkan tuliskan perintah /selesai apabila tidak ada lagi data yang dilaporkan."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan Pelaku Perjalanan dengan format berikut (garing)pelaku_perjalanan (tujuan)"
          save_context :data_traveler!
          save_context :data_traveler_message_id!
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
          session[:data_closecontact_message_id] = payload["message_id"]
          respond_with :message, text: "Berhasil melaporkan Kontak Erat. Silahkan tuliskan perintah /selesai apabila tidak ada lagi data yang dilaporkan."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan Kontak Erat dengan format berikut (garing)kontak_erat (nama-nama pelaku kontak erat)"
          save_context :data_closecontact!
          save_context :data_closecontact_message_id!
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

          save_data_report(session[:data_patient],session[:data_ispa],session[:data_traveler],session[:data_closecontact],session[:data_patient_message_id],session[:data_ispa_message_id],session[:data_traveler_message_id],session[:data_closecontact_message_id],chat["id"],chat["username"])
          respond_with :message, text: "Temuan dilaporkan keseluruh surveilance di kelurahan anda.\n\n/start Untuk melihat panduan pelaporan."
        else
          if ( (session[:data_ispa].nil?) || (session[:data_traveler].nil?) || (session[:data_closecontact].nil?) )
            respond_with :message, text: 'Anda belum melaporkan salah satu jenis laporan ISPA / Pelaku Perjalanan / Kontak Erat. /menu untuk melihat format penulisan'
          end
          if session[:data_patient].nil?
            respond_with :message, text: "Anda belum melaporkan data masyarakat. Silahkan ketikan perintah berikut:\n(garing)lapor (garing)lapor NOKTP#NAMA PASIEN##HARILAHIR(01)-BULANLAHIR(03)-TAHUNLAHIR(1990)#ALAMAT KTP#ALAMAT DOMISILI#NOMOR HP#NAMA ORTU#PRIA atau WANITA#KODE STATUS PERKAWINAN(Angka saja.)"
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
      puts "tidak terdaftar"
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

  def save_data_report(data_patient,data_ispa = nil,data_traveler = nil,data_closecontact=nil, data_patient_message, data_ispa_message = nil,data_traveler_message=nil ,data_closecontact_message=nil,chat_id,username)
    data_patient_delimited = validate_patient_delimiter(data_patient)


    marital_status = Main::MaritalStatus.where(id: data_patient_delimited[8]).first
    puts data_patient_delimited
    puts "status pernikashasd==================================="
    puts marital_status.marital_status
    username_reporter = Telegram::UsernameReporter.where(username_telegram: username).first
    username_reporter.last_activity_at = DateTime.now()

    # save data patient
    if check_no_id_patient(data_patient_delimited[0])

      @add_patient = Main::Patient.new
    else
      @add_patient = Main::Patient.where(no_identity: data_patient_delimited[0]).first
    end

    @add_patient.city = username_reporter.city
    @add_patient.district = username_reporter.district
    @add_patient.sub_district = username_reporter.sub_district
    @add_patient.citizen_association = username_reporter.citizen_association
    @add_patient.neighborhood_association = username_reporter.neighborhood_association
    @add_patient.marital_status = marital_status
    @add_patient.no_identity = data_patient_delimited[0]
    @add_patient.name = data_patient_delimited[1]
    @add_patient.name_of_parent = data_patient_delimited[6]
    @add_patient.address = data_patient_delimited[3]
    @add_patient.residence_address = data_patient_delimited[4]
    @add_patient.phone_number = data_patient_delimited[5]
    @add_patient.date_of_birth = data_patient_delimited[2]
    if data_patient_delimited[7].downcase=="pria"
      gender = "male"
    else
      gender = "female"
    end
    @add_patient.gender = gender
    @add_patient.marital_status = marital_status
    @add_patient.save

    puts "=======Add Patient"
    puts @add_patient.errors.full_messages

    check_exist_message_report = Telegram::MessageReportReporter.where(message_id: data_patient_message, chat_id: chat_id).first
    if check_exist_message_report.nil?
      add_message_report_reporter = Telegram::MessageReportReporter.new
      add_message_report_reporter.chat_id = chat_id
      add_message_report_reporter.message_id = data_patient_message
      add_message_report_reporter.username_reporter = username_reporter
      add_message_report_reporter.username_telegram = username_reporter.username_telegram
      add_message_report_reporter.message = data_patient
      add_message_report_reporter.patient = @add_patient
      add_message_report_reporter.save

      puts "=======add_message_report_reporter"
      puts add_message_report_reporter.errors.full_messages
    end
    check_exist_message_ispa = Telegram::MessageIliReporter.where(message_id: data_ispa_message, chat_id: chat_id).first
    if check_exist_message_ispa.nil?
      if !data_ispa.nil?
        add_messsage_ili_reporter = Telegram::MessageIliReporter.new
        add_messsage_ili_reporter.username_reporter = username_reporter
        add_messsage_ili_reporter.message_report_reporter = add_message_report_reporter
        add_messsage_ili_reporter.patient = @add_patient
        add_messsage_ili_reporter.chat_id = chat_id
        add_messsage_ili_reporter.message_id = data_ispa_message
        add_messsage_ili_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_ili_reporter.message = @add_patient.no_identity.to_s + " - " + @add_patient.name.to_s + ", " + " (" + data_ispa.to_s + ") " 
        add_messsage_ili_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_ili_reporter.errors.full_messages
      end 
    end

    check_exist_message_traveler = Telegram::MessageTravelerReporter.where(message_id: data_traveler_message, chat_id: chat_id).first
    if check_exist_message_traveler.nil?
      if !data_traveler.nil?
        add_messsage_traveler_reporter = Telegram::MessageTravelerReporter.new
        add_messsage_traveler_reporter.message_report_reporter = add_message_report_reporter
        add_messsage_traveler_reporter.patient = @add_patient
        add_messsage_traveler_reporter.username_reporter = username_reporter
        add_messsage_traveler_reporter.chat_id = chat_id
        add_messsage_traveler_reporter.message_id = data_traveler_message
        add_messsage_traveler_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_traveler_reporter.message = @add_patient.no_identity.to_s + " - " + @add_patient.name.to_s + ", " + " (" + data_traveler.to_s + ") "
        add_messsage_traveler_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_traveler_reporter.errors.full_messages
      end
    end

 
    check_exist_message_closecont = Telegram::MessageClosecontReporter.where(message_id: data_closecontact_message, chat_id: chat_id).first 
    if check_exist_message_closecont.nil?
      if !data_closecontact.nil?
        add_messsage_closecont_reporter = Telegram::MessageClosecontReporter.new
        add_messsage_closecont_reporter.message_report_reporter = add_message_report_reporter
        add_messsage_closecont_reporter.username_reporter = username_reporter
        add_messsage_closecont_reporter.chat_id = chat_id
        add_messsage_closecont_reporter.patient = @add_patient
        add_messsage_closecont_reporter.message_id = data_closecontact_message
        add_messsage_closecont_reporter.username_telegram = username_reporter.username_telegram
        add_messsage_closecont_reporter.message = @add_patient.no_identity.to_s + " - " + @add_patient.name.to_s + ", " + " (" + data_closecontact.to_s + ") " 
        add_messsage_closecont_reporter.save

        puts "=======add_messsage_ili_reporter"
        puts add_messsage_closecont_reporter.errors.full_messages
      end
    end

    public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: username_reporter.sub_district.id).first

    username_observers = Telegram::UsernameObserver.where(main_public_health_center_id: public_health_center.id)
    if (username_observers.any?) || (username_observers.exists?)
      username_observers.each do |username_observer|
        chat_observer = Telegram::ChatObserver.where(telegram_username_observer_id: username_observer.id).first
        chat_reporter = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id)

        data_warga = "Data warga : \n" + "No KTP : " + data_patient_delimited[0] + "\nNama : "+data_patient_delimited[1] + "\nTanggal Lahir : " + data_patient_delimited[2] + "\nAlamat : " + data_patient_delimited[3] + "\nAlamat Domisili : " + data_patient_delimited[4] + "\nNo. HP : " + data_patient_delimited[5] + "\nNama Ortu : " + data_patient_delimited[6] + "\nJenis Kelamin : " + data_patient_delimited[7].upcase
        data_pelapor = "Nama : "+username_reporter.name+"\nKelurahan : "+username_reporter.sub_district.sub_district+"\nRW : "+username_reporter.citizen_association.citizen_association+"\nRT : "+username_reporter.neighborhood_association.neighborhood_association+""

        begin
          puts "=========================kirim pesan"
          puts chat_observer.username_observer.username_telegram
          puts chat_observer.chat_id


          # add_message_report_observer = Telegram::MessageReportObserver.new
          # add_message_report_observer.chat_id = chat_id
          # add_message_report_observer.username_observer = username_observer
          # add_message_report_observer.username_telegram = username_observer.username_telegram
          # add_message_report_observer.message = data_patient
          # add_message_report_observer.save

          # puts "=======add_message_report_observer"
          # puts add_message_report_observer.errors.full_messages

          # if !data_ispa.nil?
          #   add_messsage_ili_observer = Telegram::MessageIliObserver.new
          #   add_messsage_ili_observer.username_observer = username_observer
          #   add_messsage_ili_observer.chat_id = chat_id
          #   add_messsage_ili_observer.username_telegram = username_observer.username_telegram
          #   add_messsage_ili_observer.message = data_ispa
          #   add_messsage_ili_observer.save
            
          #   puts "=======add_messsage_ili_observer"
          #   puts add_messsage_ili_observer.errors.full_messages
          # end

          # if !data_traveler.nil?
          #   add_messsage_traveler_observer = Telegram::MessageTravelerObserver.new
          #   add_messsage_traveler_observer.username_observer = username_observer
          #   add_messsage_traveler_observer.chat_id = chat_id
          #   add_messsage_traveler_observer.username_telegram = username_observer.username_telegram
          #   add_messsage_traveler_observer.message = data_traveler
          #   add_messsage_traveler_observer.save
    
    
          #   puts "=======add_messsage_ili_reporter"
          #   puts add_messsage_traveler_observer.errors.full_messages
          # end
    
          # if !data_closecontact.nil?
          #   add_messsage_closecont_observer = Telegram::MessageClosecontObserver.new
          #   add_messsage_closecont_observer.username_observer = username_observer
          #   add_messsage_closecont_observer.chat_id = chat_id
          #   add_messsage_closecont_observer.username_telegram = username_observer.username_telegram
          #   add_messsage_closecont_observer.message = data_closecontact
          #   add_messsage_closecont_observer.save
    
          #   puts "=======add_messsage_ili_reporter"
          #   puts add_messsage_closecont_observer.errors.full_messages
          # end

          data_chat = data_warga

          data_chat += !data_traveler.nil? ? "\n \nTujuan : "+data_traveler+"" : ""
          data_chat += !data_closecontact.nil? ? "\n \nNama pelaku kontak erat : "+data_closecontact+"" : ""
          data_chat += !data_ispa.nil? ? "\n \nData ispa : "+data_ispa+"" : ""
          data_chat += "\n \nPelapor : \n"+data_pelapor

          Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_chat)

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
        session.delete(:data_patient_message_id)
        session.delete(:data_ispa_message_id)
        session.delete(:data_traveler_message_id)
        session.delete(:data_closecontact_message_id)

      end
    else
      Telegram.bot.send_message(chat_id: chat_id, text: "Tidak ada surveilance didaerah anda, silahkan lapor ke pemerintah daerah.")
    end
  end

  def check_chat(username,chat_id,type_user)
    
    if type_user=="reporter"
      username_reporter = Telegram::UsernameReporter.where('username_telegram = ?', username).first
      
      check_chat = Telegram::ChatReporter.where("telegram_username_reporter_id = ? or chat_id = ?", username_reporter.id,chat_id.to_s)
      check_chat_id = Telegram::ChatReporter.where("chat_id = ?", chat_id.to_s)


      if check_chat.count == 0
      #   check_chat.destroy_all
      # elsif check_chat.count == 1
      # elsif check_chat.count == 0
        
            add_check_chat = Telegram::ChatReporter.new
            add_check_chat.username_reporter = username_reporter
            add_check_chat.chat_id = chat_id
            add_check_chat.save
      else
          puts "tes"
          check_double = Telegram::ChatReporter.where.not("telegram_username_reporter_id = ? and chat_id = ?", username_reporter.id,chat_id.to_s)
          check_double.each do |te|
            puts te
          end
          if check_double.any?
            check_double.destroy_all
          end
          
      end
      
      

    else

      username_observer = Telegram::UsernameObserver.where('username_telegram = ?', username).first

      check_chat = Telegram::ChatObserver.where("telegram_username_observer_id = ? and chat_id = ?", username_observer.id,chat_id.to_s)
      check_chat_id = Telegram::ChatObserver.where("chat_id = ?", chat_id.to_s)


      if check_chat.count == 0
        #   check_chat.destroy_all
        # elsif check_chat.count == 1
        # elsif check_chat.count == 0
          
              add_check_chat = Telegram::ChatObserver.new
              add_check_chat.username_observer = username_observer
              add_check_chat.chat_id = chat_id
              add_check_chat.save
      else
          puts "tes"
          check_double = Telegram::ChatObserver.where.not("telegram_username_observer_id = ? and chat_id = ?", username_observer.id,chat_id.to_s)
          check_double.each do |te|
            puts te
          end
          if check_double.any?
            check_double.destroy_all
          end
          
      end

    end
  end
end
