class AddDeletedAtToTelegramMessageReportSurveilance < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_report_surveilances, :deleted_at, :datetime
    add_index :telegram_message_report_surveilances, :deleted_at
  end
end
