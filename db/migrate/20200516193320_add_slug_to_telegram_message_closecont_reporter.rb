class AddSlugToTelegramMessageClosecontReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_closecont_reporters, :slug, :string
    add_index :telegram_message_closecont_reporters, :slug, unique: true
  end
end
