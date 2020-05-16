class AddNameToTelegramUsernameObserver < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_observers, :name, :string
  end
end
