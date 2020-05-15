class CreateTelegramMessageReportRts < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_message_report_rts do |t|
      t.references :telegram_username_rt, foreign_key: true
      t.string :chat_id
      t.text :message
      t.string :username_telegram

      t.timestamps
    end
  end
end
