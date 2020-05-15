class CreateTelegramChatReporters < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_chat_reporters do |t|
      t.references :telegram_username_reporter, foreign_key: true
      t.string :chat_id

      t.timestamps
    end
    add_index :telegram_chat_reporters, :chat_id, unique: true
  end
end
