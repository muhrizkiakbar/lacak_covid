class AddSlugToTelegramMessageClosecontObserver < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_closecont_observers, :slug, :string
    add_index :telegram_message_closecont_observers, :slug, unique: true
  end
end
