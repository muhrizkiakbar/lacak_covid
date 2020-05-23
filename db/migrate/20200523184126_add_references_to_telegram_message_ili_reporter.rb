class AddReferencesToTelegramMessageIliReporter < ActiveRecord::Migration[5.2]
  def change
    add_reference :telegram_message_ili_reporters, :main_patient, foreign_key: true
    add_reference :telegram_message_ili_reporters, :telegram_message_report_reporter, foreign_key: true
    add_reference :telegram_message_ili_reporters, :user, foreign_key: true, :null => true
  end
end
