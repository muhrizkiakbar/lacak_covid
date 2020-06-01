class AddMessageIdToTelegramMessageReportReporter < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_report_reporters, :message_id, :string, :null => true
  end
end
