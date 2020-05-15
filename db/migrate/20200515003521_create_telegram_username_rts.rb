class CreateTelegramUsernameRts < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_username_rts do |t|
      t.references :main_city, foreign_key: true
      t.references :main_district, foreign_key: true
      t.references :main_sub_district, foreign_key: true
      t.references :main_citizen_association, foreign_key: true
      t.references :main_neighborhood_association, foreign_key: true
      t.string :username_telegram
      t.datetime :last_activity

      t.timestamps
    end
    add_index :telegram_username_rts, :username_telegram, unique: true
  end
end
