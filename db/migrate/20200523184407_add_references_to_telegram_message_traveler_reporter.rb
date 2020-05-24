class AddReferencesToTelegramMessageTravelerReporter < ActiveRecord::Migration[5.2]
  def change
    add_reference :telegram_message_traveler_reporters, :main_patient, foreign_key: true, index: {:name => "index_m_patient_on_tele_message_travel_report"}
    add_reference :telegram_message_traveler_reporters, :user, foreign_key: true, :null => true, index: {:name => "index_user_on_tele_message_travel_report"}
    add_reference :telegram_message_traveler_reporters, :telegram_message_report_reporter, foreign_key: true, index: {:name => "index_tele_mes_rep_report_on_tele_mes_trav_report"}
    
  end
end
