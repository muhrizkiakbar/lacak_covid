class AddSlugToTelegramMessageIliSurveilance < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_ili_surveilances, :slug, :string
    add_index :telegram_message_ili_surveilances, :slug, unique: true
  end
end
