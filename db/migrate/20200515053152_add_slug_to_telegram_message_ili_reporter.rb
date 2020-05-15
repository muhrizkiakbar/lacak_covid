class AddSlugToTelegramMessageIliReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_ili_reporters, :slug, :string
    add_index :telegram_message_ili_reporters, :slug, unique: true
  end
end
