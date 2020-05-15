class AddSlugToTelegramMessageIliObserver < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_ili_observers, :slug, :string
    add_index :telegram_message_ili_observers, :slug, unique: true
  end
end
