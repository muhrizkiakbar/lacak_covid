class AddTelegramMessageClosecontReporterToLampiranElevenCloseContactInformation < ActiveRecord::Migration[5.2]
  def change
    add_reference :lampiran_eleven_close_contact_informations, :telegram_message_closecont_reporter, foreign_key: true, :null => true, index: {:name => "index_tele_mes_close_report_on_l_e_closecontinfo"}
  end
end
