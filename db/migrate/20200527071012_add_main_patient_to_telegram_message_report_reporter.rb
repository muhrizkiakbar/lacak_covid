class AddMainPatientToTelegramMessageReportReporter < ActiveRecord::Migration[5.2]
  def change
    add_reference :telegram_message_report_reporters, :main_patient, foreign_key: true
  end
end
