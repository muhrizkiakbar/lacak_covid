class AddMessageIdToTelegramMessageClosecontReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_closecont_reporters, :message_id, :string
  end
end
