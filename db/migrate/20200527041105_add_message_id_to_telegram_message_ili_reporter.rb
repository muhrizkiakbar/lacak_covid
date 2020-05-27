class AddMessageIdToTelegramMessageIliReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_ili_reporters, :message_id, :string
  end
end
