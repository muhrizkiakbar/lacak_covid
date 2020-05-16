class AddAddressToTelegramUsernameReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_reporters, :address, :string
  end
end
