class AddSlugToTelegramUsernameObserver < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_observers, :slug, :string
    add_index :telegram_username_observers, :slug, unique: true
  end
end
