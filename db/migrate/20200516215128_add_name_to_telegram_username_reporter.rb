class AddNameToTelegramUsernameReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_reporters, :name, :string
  end
end
