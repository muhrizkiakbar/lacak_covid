class CreateTelegramMessageReportSurveilances < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_message_report_surveilances do |t|
      t.references :telegram_username_surveilance, foreign_key: true, index: {:name => "index_t_username_surveilance_on_t_message_report_surveilance"}
      t.string :chat_id
      t.text :message
      t.string :username_telegram

      t.timestamps
    end
  end
end
