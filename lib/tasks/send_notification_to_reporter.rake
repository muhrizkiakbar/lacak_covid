namespace :notification_to_reporter do
    desc "Send notification to reporter"
    task reminder_checkin: :environment do
        username_reporters = Telegram::UsernameReporter.where.not(last_activity_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).where.not(last_activity_at: nil)
        username_reporters.each do |username_reporter|
            chat = Telegram::ChatReporter.where(telegram_username_reporter_id: username_reporter.id).first
            if !chat.nil?
                begin
                    message = "Hari ini anda belum ada mengirimkan laporan. Silahkan lapor!!\n\nUntuk melihat bagaimana cara melapor, silahkan ketik perintah : \n/caralapor\n\nJika Anda butuh bantuan, silahkan ketika perintah :\n/bantuan\n\n*Anda akan mendapatkan Notifikasi ini apabila anda tidak melapor sebelum jam 16:00."
                    Telegram.bot.send_message(chat_id: chat.chat_id, text: message)
                rescue Telegram::Bot::Forbidden

                end
            end
        end
    end
end
