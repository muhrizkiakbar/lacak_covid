class Telegram::TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  @@welcome_message_reporter = "Selamat datang Pak RT, terimakasih telah berkontribusi dengan program Lacak Covid-19 Kalsel.\n\[nSilahkan pilih ketik perintah yang anda butuhkan:\n\n(garing)suku = Untuk menampilkan kumpulan data suku.\n \n(garing)status_pernikahan = Untuk menampilkan kumpulan data status pernikahan.\n \n(garing)lapor NOKTP#NAMA PASIEN#NAMA ORTU#ALAMAT#NOMORHP#HARILAHIR(01)/BULANLAHIR(03)/TAHUNLAHIR(1990)#PRIA/WANITA#KODE STATUS PERKAWINAN(Angka saja.)#SUKU(Angka saja) = Untuk melaporkan masyarakat yang begejala. \n \n(garing)ulanglapor NOKTP#NAMA PASIEN#NAMA ORTU#ALAMAT#NOMORHP#HARILAHIR(01)/BULANLAHIR(03)/TAHUNLAHIR(1990)#PRIA/WANITA#KODE STATUS PERKAWINAN(Angka saja.)#SUKU(Angka saja) = Untuk memperbaiki kesalahan penulisan data masyarakat bergejala yang dilaporkan. \n \n(garing)ili (gejala) = Untuk melaporkan gejala yang dialami masyarakat yang dilaporkan.\n \n(garing)ulangili (gejala) = Untuk memperbaiki kesalahan laporan gejala dialami masyarakat yang dilaporkan.\n \n(garing)selesai = Jika pelaporan telah selesai. \n \n \n(garing)menu = Untuk melihat menu ini kembali. \n \n \n(garing)bantuan = Berupa video petunjuk penggunaan. (Youtube)"
  @@welcome_message_observer = "Selamat datang Surveilance, selalu nyalakan notifikasi telegram Anda agar mendapatkan informasi dari Pak RT. Terimakasih."

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

  def suku!(*)

    message = "Data Suku :\n"

    tribes = Main::Tribe.all

    tribes.each do |tribe|
      message = message + tribe.id.to_s + ". " + tribe.tribe + "\n" 
    end

    respond_with :message, text: message + "\n(garing)menu = Untuk kembali ke menu."
  end

  def status_pernikahan!(*)
    message = "Data Status Pernikahan :\n"

    marital_statuses = Main::MaritalStatus.all

    marital_statuses.each do |marital_status|
      message = message + marital_status.id.to_s + ". " + marital_status.marital_status + "\n" 
    end

    respond_with :message, text: message + "\n(garing)menu = Untuk kembali ke menu."

  end

  def lapor!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        @failed_message = "Mohon Input Laporan Pasien Dengan Format Berikut : NOKTP#NAMA PASIEN#NAMA ORTU#ALAMAT#NOMORHP#HARILAHIR(01)/BULANLAHIR(03)/TAHUNLAHIR(1990)#PRIA/WANITA#KODE STATUS PERKAWINAN(Angka saja.)#SUKU(Angka saja)"
        if args.any?

          data_patient_delimited = validate_patient_delimiter(args.join(' '))

          if data_patient_delimited.length == 9
            if (data_patient_delimited[0].to_i).to_s.length == 16
              if validate_marital_status(data_patient_delimited[7])

                if validate_tribe(data_patient_delimited[8])
                  session[:data_patient] = args.join(' ')
                  respond_with :message, text: "Berhasil. Silahkan melakukan laporkan ILI."
                else
                  respond_with :message, text: @failed_message
                end

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
        respond_with :message, text: 'Maaf, Anda bukan surveilance.' 
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
    
  end

  def ili!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        if args.any?
          session[:data_ili] = args.join(' ')
          respond_with :message, text: "Berhasil melaporkan ILI. Silahkan tuliskan perintah (garing)selesai."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan ILI dengan format berikut (garing)ili (gejala)"
          save_context :data_ili!
        end
      else
        respond_with :message, text: 'Maaf, Anda bukan surveilance.'
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
    
  end
  
  def ulang_lapor!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        @failed_message = "Mohon Input Laporan Pasien Dengan Format Berikut : NOKTP#NAMA PASIEN#NAMA ORTU#ALAMAT#NOMORHP#HARILAHIR(01)/BULANLAHIR(03)/TAHUNLAHIR(1990)#PRIA/WANITA#KODE STATUS PERKAWINAN(Angka saja.)#SUKU(Angka saja)"
        if args.any?

          data_patient_delimited = validate_patient_delimiter(args.join(' '))

          if data_patient_delimited.length == 9
            if data_patient_delimited[7].to_i.length == 16
              if validate_marital_status(data_patient_delimited[7])

                if validate_tribe(data_patient_delimited[8])
                  session[:data_patient] = args.join(' ')
                  respond_with :message, text: "Berhasil. Silahkan melakukan laporkan ILI."
                else
                  respond_with :message, text: @failed_message
                end

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
        respond_with :message, text: 'Maaf, Anda bukan surveilance.'
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def ulang_ili!(*args)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        if args.any?
          session[:data_ili] = args.join(' ')
          respond_with :message, text: "Berhasil melaporkan ILI. Silahkan tuliskan perintah (garing)selesai."
        else
          respond_with :message, text: "Mohon Tuliskan Laporan ILI dengan format berikut (garing)ili (gejala)"
          save_context :data_ili!
        end
      end
      
    else
      respond_with :message, text: 'Maaf, Anda tidak terdaftar.'
    end
  end

  def selesai!(*)
    auth = check_username(chat["username"],chat["id"])
    if auth["status"]
      if auth["type_user"] == "reporter"
        if (!session[:data_patient].nil?) || (!session[:data_ili].nil?)

          save_data_report(session[:data_patient],session[:data_ili],chat["id"],chat["username"])
          respond_with :message, text: 'Data telah disimpan'
        else
          if session[:data_patient].nil?
            respond_with :message, text: 'Anda belum melaporkan data masyarakat bergejala. Silahkan ketikan perintah berikut :\n(garing)lapor NOKTP#NAMA PASIEN#NAMA ORTU#ALAMAT#NOMORHP#HARILAHIR(01)/BULANLAHIR(03)/TAHUNLAHIR(1990)#PRIA/WANITA#KODE STATUS PERKAWINAN(Angka saja.)#SUKU(Angka saja)'
          end
          if session[:data_ili].nil?
            respond_with :message, text: 'Anda belum melaporkan data ili dari masyarakat bergejala. Silahkan ketikan perintah berikut:\n(garing)ili (gejala).'
          end
        end
      else
        respond_with :message, text: 'Maaf, Anda bukan surveilance.'
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

  def validate_tribe(tribe)
    tribe = Main::Tribe.where(id: tribe).first
    if tribe
      return true
    else
      return false
    end
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

  def save_data_report(data_patient,data_ili,chat_id,username)
    data_patient_delimited = validate_patient_delimiter(data_patient)

    # save data patient
    if check_no_id_patient(data_patient_delimited[0])

      tribe = Main::Tribe.where(id: data_patient_delimited[8]).first
      marital_status = Main::MaritalStatus.where(id: data_patient_delimited[7]).first
      username_reporter = Telegram::UsernameReporter.where(username_telegram: username).first
      username_reporter.last_activity_at = DateTime.now()

      add_patient = Main::Patient.new
      add_patient.city = username_reporter.city
      add_patient.district = username_reporter.district
      add_patient.sub_district = username_reporter.sub_district
      add_patient.citizen_association = username_reporter.citizen_association
      add_patient.neighborhood_association = username_reporter.neighborhood_association
      add_patient.marital_status = marital_status
      add_patient.tribe = tribe
      add_patient.no_identity = data_patient_delimited[0]
      add_patient.name = data_patient_delimited[1]
      add_patient.name_of_parent = data_patient_delimited[2]
      add_patient.address = data_patient_delimited[3]
      add_patient.phone_number = data_patient_delimited[4]
      add_patient.date_of_birth = data_patient_delimited[5]
      if data_patient_delimited[6].downcase=="pria"
        gender = "male"
      else
        gender = "female"
      end
      add_patient.gender = gender
      add_patient.marital_status = marital_status
      add_patient.tribe = tribe
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

      add_messsage_ili_reporter = Telegram::MessageIliReporter.new
      add_messsage_ili_reporter.username_reporter = username_reporter
      add_messsage_ili_reporter.chat_id = chat_id
      add_messsage_ili_reporter.username_telegram = username_reporter.username_telegram
      add_messsage_ili_reporter.message = data_ili
      add_messsage_ili_reporter.save

      puts "=======add_messsage_ili_reporter"
      puts add_messsage_ili_reporter.errors.full_messages

      public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: username_reporter.sub_district.id).first

      username_observers = Telegram::UsernameObserver.where(main_public_health_center_id: public_health_center.id)

      username_observers.each do |username_observer|
        chat_observer = Telegram::ChatObserver.where(telegram_username_observer_id: username_observer.id).first
        chat_reporter = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id)

        begin
          Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_patient+"#"+data_ili+"#"+username_reporter.username_telegram)
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

          add_messsage_ili_observer = Telegram::MessageIliObserver.new
          add_messsage_ili_observer.username_observer = username_observer
          add_messsage_ili_observer.chat_id = chat_id
          add_messsage_ili_observer.username_telegram = username_observer.username_telegram
          add_messsage_ili_observer.message = data_ili
          add_messsage_ili_observer.save

          puts "=======add_messsage_ili_observer"
          puts add_messsage_ili_observer.errors.full_messages

        rescue Telegram::Bot::Forbidden
          puts "=========================Gagal"
          puts "Gagal kirim"
        end
        la_username_observer = Telegram::UsernameObserver.where(id: username_observer.id).first

        username_reporter.last_activity_at = DateTime.now()
        username_reporter.save

        session.delete(:data_patient)
        session.delete(:data_ili)

      end
      
    else
      
      tribe = Main::Tribe.where(id: data_patient_delimited[8]).first
      marital_status = Main::MaritalStatus.where(id: data_patient_delimited[7]).first
      username_reporter = Telegram::UsernameReporter.where(username_telegram: username).first
      username_reporter.last_activity_at = DateTime.now()

      add_patient = Main::Patient.where(no_identity: data_patient_delimited[0]).first
      add_patient.city = username_reporter.city
      add_patient.district = username_reporter.district
      add_patient.sub_district = username_reporter.sub_district
      add_patient.citizen_association = username_reporter.citizen_association
      add_patient.neighborhood_association = username_reporter.neighborhood_association
      add_patient.marital_status = marital_status
      add_patient.tribe = tribe
      add_patient.no_identity = data_patient_delimited[0]
      add_patient.name = data_patient_delimited[1]
      add_patient.name_of_parent = data_patient_delimited[2]
      add_patient.address = data_patient_delimited[3]
      add_patient.phone_number = data_patient_delimited[4]
      add_patient.date_of_birth = data_patient_delimited[5]
      if data_patient_delimited[6].downcase=="pria"
        gender = "male"
      else
        gender = "female"
      end
      add_patient.gender = gender
      add_patient.marital_status = marital_status
      add_patient.tribe = tribe
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

      add_messsage_ili_reporter = Telegram::MessageIliReporter.new
      add_messsage_ili_reporter.username_reporter = username_reporter
      add_messsage_ili_reporter.chat_id = chat_id
      add_messsage_ili_reporter.username_telegram = username_reporter.username_telegram
      add_messsage_ili_reporter.message = data_ili
      add_messsage_ili_reporter.save

      puts "=======add_messsage_ili_reporter"
      puts add_messsage_ili_reporter.errors.full_messages

      public_health_center = Main::PublicHealthCenter.where(main_sub_district_id: username_reporter.sub_district.id).first

      username_observers = Telegram::UsernameObserver.where(main_public_health_center_id: public_health_center.id)

      username_observers.each do |username_observer|
        chat_observer = Telegram::ChatObserver.where(telegram_username_observer_id: username_observer.id).first
        chat_reporter = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id)

        begin
          Telegram.bot.send_message(chat_id: chat_observer.chat_id.to_i, text: data_patient+"#"+data_ili+"#"+username_reporter.username_telegram)
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

          add_messsage_ili_observer = Telegram::MessageIliObserver.new
          add_messsage_ili_observer.username_observer = username_observer
          add_messsage_ili_observer.chat_id = chat_id
          add_messsage_ili_observer.username_telegram = username_observer.username_telegram
          add_messsage_ili_observer.message = data_ili
          add_messsage_ili_observer.save

          puts "=======add_messsage_ili_observer"
          puts add_messsage_ili_observer.errors.full_messages

        rescue Telegram::Bot::Forbidden
          puts "=========================Gagal"
          puts "Gagal kirim"
        end
        la_username_observer = Telegram::UsernameObserver.where(id: username_observer.id).first

        username_reporter.last_activity_at = DateTime.now()
        username_reporter.save

        session.delete(:data_patient)
        session.delete(:data_ili)

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
