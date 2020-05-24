class AddReferencesToTelegramMessageClosecontReporter < ActiveRecord::Migration[5.2]
  def change
    add_reference :telegram_message_closecont_reporters, :main_patient, foreign_key: true, index: {:name => "index_m_patient_on_tele_message_closecont_report"}
    add_reference :telegram_message_closecont_reporters, :user, foreign_key: true, :null => true, index: {:name => "index_user_on_tele_message_closecont_report"}
    add_reference :telegram_message_closecont_reporters, :telegram_message_report_reporter, foreign_key: true, index: {:name => "index_tele_mess_close_rep_on_tele_mess_closecont_rep"}
  end
end
