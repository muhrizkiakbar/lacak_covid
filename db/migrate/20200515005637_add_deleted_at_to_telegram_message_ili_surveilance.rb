class AddDeletedAtToTelegramMessageIliSurveilance < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_ili_surveilances, :deleted_at, :datetime
    add_index :telegram_message_ili_surveilances, :deleted_at
  end
end
