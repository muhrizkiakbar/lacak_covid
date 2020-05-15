class AddSlugToTelegramMessageIliRt < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_message_ili_rts, :slug, :string
    add_index :telegram_message_ili_rts, :slug, unique: true
  end
end
