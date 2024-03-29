class CreateTelegramMessageTravelerObservers < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_message_traveler_observers do |t|
      t.references :telegram_username_observer, foreign_key: true, index: {:name => "index_t_username_reporter_on_t_message_traveler_observer"}
      t.string :chat_id
      t.string :username_telegram
      t.text :message

      t.timestamps
    end
  end
end
