class AddDeletedAtToTelegramUsernameRt < ActiveRecord::Migration[5.2]
  def change
    add_column :telegram_username_rts, :deleted_at, :datetime
    add_index :telegram_username_rts, :deleted_at
  end
end
