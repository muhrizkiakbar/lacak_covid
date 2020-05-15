class AddDeletedAtToTelegramMessageReportRt < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_report_rts, :deleted_at, :datetime
    add_index :telegram_message_report_rts, :deleted_at
  end
end
