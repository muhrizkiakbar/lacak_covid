class CreateTelegramMessageIliRts < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_message_ili_rts do |t|
      t.references :telegram_username_rt, foreign_key: true
      t.string :chat_id
      t.string :username_telegram
      t.text :message

      t.timestamps
    end
  end
end
