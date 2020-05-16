class AddSlugToTelegramMessageTravelerObserver < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_traveler_observers, :slug, :string
    add_index :telegram_message_traveler_observers, :slug, unique: true
  end
end
