class CreateTelegramMessageIliSurveilances < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_message_ili_surveilances do |t|
      t.references :telegram_username_surveilance, foreign_key: true, index: {:name => "index_t_username_surveilance_on_t_message_ili_surveilance"}
      t.string :chat_id
      t.string :username_telegram
      t.text :message

      t.timestamps
    end
  end
end
