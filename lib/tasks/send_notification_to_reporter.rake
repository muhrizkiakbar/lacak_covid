namespace :notification_to_reporter do
    desc "Send notification to reporter"
    task reminder_checkin: :environment do
        username_reporters = Telegram::UsernameReporter.where.not(last_activity_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).where.not(last_activity_at: nil)
        username_reporters.each do |username_reporter|

            chat = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id).first

            message = "Hari ini anda belum ada mengirimkan laporan. Silahkan lapor dengan format (garing)lapor NOKTP#NAMA PASIEN#HARILAHIR(01)-BULANLAHIR(03)-TAHUNLAHIR(1990)#ALAMAT#NOMOR HP#NAMA ORTU#PRIA atau WANITA#KODE STATUS PERKAWINAN(Angka saja.) apabila ada temuan.\n\nAtau ketik (garing)tidak_ada_temuan apabila tidak ada temuan."
            Telegram.bot.send_message(chat_id: chat.chat_id, text: message)
        end
    end
end
