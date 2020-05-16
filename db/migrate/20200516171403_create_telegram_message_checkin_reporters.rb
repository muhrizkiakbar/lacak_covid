class CreateTelegramMessageCheckinReporters < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_message_checkin_reporters do |t|
      t.references :telegram_username_reporter, foreign_key: true, index: {:name => "index_t_username_reporter_on_t_message_checkin_reporter"}
      t.string :chat_id
      t.string :username_telegram

      t.timestamps
    end
  end
end
