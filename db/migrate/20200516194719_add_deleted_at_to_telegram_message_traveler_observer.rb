class AddDeletedAtToTelegramMessageTravelerObserver < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_traveler_observers, :deleted_at, :datetime
    add_index :telegram_message_traveler_observers, :deleted_at
  end
end
