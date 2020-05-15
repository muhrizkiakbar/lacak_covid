class AddSlugToTelegramUsernameReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_reporters, :slug, :string
    add_index :telegram_username_reporters, :slug, unique: true
  end
end
