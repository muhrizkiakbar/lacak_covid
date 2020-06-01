class RemoveIndexFromUsernameObserver < ActiveRecord::Migration[5.2]
  def change
    remove_index :telegram_username_observers, name: "index_telegram_username_observers_on_username_telegram"
  end
end
