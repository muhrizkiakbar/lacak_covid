class Telegram::TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  @@welcome_message_reporter = "Selamat datang Pak Erte, terimakasih telah berkontribusi dengan program Lacak Covid-19 Kalsel.\n\nSilahkan pilih ketik perintah yang anda butuhkan:\n\n(garing)suku = Untuk menampilkan kumpulan data suku.\n \n(garing)status_pernikahan = Untuk menampilkan kumpulan data status pernikahan.\n \n(garing)lapor NOKTP#NAMA PASIEN#NAMA ORTU#ALAMAT#NOMORHP#HARILAHIR(01)/BULANLAHIR(03)/TAHUNLAHIR(1990)#PRIA/WANITA = Untuk melaporkan masyarakat yang begejala. \n \n(garing)ulanglapor NOKTP#NAMA PASIEN#NAMA ORTU#ALAMAT#NOMORHP#HARILAHIR(01)/BULANLAHIR(03)/TAHUNLAHIR(1990)#PRIA/WANITA = Untuk memperbaiki kesalahan penulisan data masyarakat bergejala yang dilaporkan. \n \n(garing)ili (gejala) = Untuk melaporkan gejala yang dialami masyarakat yang dilaporkan.\n \n(garing)ulangili (gejala) = Untuk memperbaiki kesalahan laporan gejala dialami masyarakat yang dilaporkan.\n \n(garing)selesai = Jika pelaporan telah selesai. \n \n \n(garing)menu = Untuk melihat menu ini kembali. \n \n \n(garing)bantuan = Berupa video petunjuk penggunaan. (Youtube)"
  @@welcome_message_observer = "Selamat datang Surveilance, selalu nyalakan notifikasi telegram Anda. Terimakasih."

  def start!(*)    
    auth = check_username(chat["username"])
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

  def lapor!(*args)
    if args.any?
      session[:data_patient] = args.join(' ')
      respond_with :message, text: t('.notice')
    else
      respond_with :message, text: "Mohon Input Laporan Pasien Dengan Format Berikut."
      save_context :data_patient!
    end
  end

  def ili!(*args)
    if args.any?
      session[:data_patient] = args.join(' ')
      respond_with :message, text: t('.notice')
    else
      respond_with :message, text: "Mohon Tuliskan Laporan ILI dengan format berikut #ILI#GEJALA."
      save_context :data_patient!
    end
  end
  
  def ulang_lapor!(*)
  end

  def ulang_ili!(*)
  end

  def selesai!(*)
  end

  def memo!(*args)
    if args.any?
      session[:memo] = args.join(' ')
      respond_with :message, text: t('.notice')
    else
      respond_with :message, text: t('.prompt')
      save_context :memo!
    end
  end

  def remind_me!(*)
    to_remind = session.delete(:memo)
    reply = to_remind || t('.nothing')
    respond_with :message, text: reply
  end

  def keyboard!(value = nil, *)
    if value
      respond_with :message, text: t('.selected', value: value)
    else
      save_context :keyboard!
      respond_with :message, text: t('.prompt'), reply_markup: {
        keyboard: [t('.buttons')],
        resize_keyboard: true,
        one_time_keyboard: true,
        selective: true,
      }
    end
  end

  def inline_keyboard!(*)
    respond_with :message, text: t('.prompt'), reply_markup: {
      inline_keyboard: [
        [
          {text: t('.alert'), callback_data: 'alert'},
          {text: t('.no_alert'), callback_data: 'no_alert'},
        ],
        [{text: t('.repo'), url: 'https://github.com/telegram-bot-rb/telegram-bot'}],
      ],
    }
  end

  def callback_query(data)
    if data == 'alert'
      answer_callback_query t('.alert'), show_alert: true
    else
      answer_callback_query t('.no_alert')
    end
  end

  def message(message)
    respond_with :message, text: t('.content', text: message['text'])
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
        text: t('telegram_webhooks.action_missing.command', command: action_options[:command])
    else
      respond_with :message, text: t('telegram_webhooks.action_missing.feature', action: action)
    end
  end

  private

  def check_username(username)
    username_rt = Telegram::UsernameReporter.where('username_telegram = ?', username)
    username_surveilance = nil
    type_user = nil

    if !username_rt.nil?
      username_rt = username_rt.first
      type_user = "reporter"
    else
      username_surveilance = Telegram::UsernameObserver.where('username_telegram = ?', username)
      username_rt = nil
      type_user = "observer"

      if !username_surveilance.nil?
        username_surveilance = username_surveilance.first
      end
    end

    status = false
    if (username_rt == nil) && (username_surveilance == nil) 
      status = false
    else
      status = true
    end

    result = { "type_user" => type_user, "status" => status }
    return result

  end
end
