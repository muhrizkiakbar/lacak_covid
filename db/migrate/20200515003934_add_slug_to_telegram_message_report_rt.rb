class AddSlugToTelegramMessageReportRt < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_report_rts, :slug, :string
    add_index :telegram_message_report_rts, :slug, unique: true
  end
end
