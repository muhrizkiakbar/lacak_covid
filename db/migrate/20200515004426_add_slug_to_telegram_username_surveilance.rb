class AddSlugToTelegramUsernameSurveilance < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_surveilances, :slug, :string
    add_index :telegram_username_surveilances, :slug, unique: true
  end
end
