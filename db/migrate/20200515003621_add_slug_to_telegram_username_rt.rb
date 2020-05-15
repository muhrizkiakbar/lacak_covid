class AddSlugToTelegramUsernameRt < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_rts, :slug, :string
    add_index :telegram_username_rts, :slug, unique: true
  end
end
