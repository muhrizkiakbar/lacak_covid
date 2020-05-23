class AddTelegramMessageIliReporterToLSixFirst < ActiveRecord::Migration[5.2]
  def change
    add_reference :l_six_firsts, :telegram_message_ili_reporter, foreign_key: true
  end
end
