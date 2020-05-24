class AddTelegramMessageIliReporterToLSixFirst < ActiveRecord::Migration[5.2]
  def change
    add_reference :l_six_firsts, :telegram_message_ili_reporter, foreign_key: true, index: {:name => "index_tele_message_ili_report_on_l_s_first"}
  end
end
