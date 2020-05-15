class AddDeletedAtToTelegramUsernameReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_reporters, :deleted_at, :datetime
    add_index :telegram_username_reporters, :deleted_at
  end
end