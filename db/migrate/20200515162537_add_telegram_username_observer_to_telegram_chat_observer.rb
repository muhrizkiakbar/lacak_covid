class AddTelegramUsernameObserverToTelegramChatObserver < ActiveRecord::Migration[5.2]
  def change
    add_reference :telegram_chat_observers, :telegram_username_observer, foreign_key: true
  end
end
