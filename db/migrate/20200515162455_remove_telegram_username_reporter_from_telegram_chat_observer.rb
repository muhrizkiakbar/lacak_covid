class RemoveTelegramUsernameReporterFromTelegramChatObserver < ActiveRecord::Migration[5.2]
  def change
    remove_reference :telegram_chat_observers, :telegram_username_reporter, foreign_key: true
  end
end
