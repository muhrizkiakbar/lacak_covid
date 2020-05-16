class AddPhoneNumberToTelegramUsernameReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_reporters, :phone_number, :string
  end
end
