class CreateTelegramUsernameObservers < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_username_observers do |t|
      t.references :main_dinkes_province, foreign_key: true
      t.references :main_dinkes_region, foreign_key: true
      t.references :main_hospital, foreign_key: true
      t.references :main_public_health_center, foreign_key: true, index: {:name => "index_m_public_health_center_on_t_username_reporter"}
      t.references :user, foreign_key: true
      t.string :username_telegram
      t.datetime :last_activity_at

      t.timestamps
    end
    add_index :telegram_username_observers, :username_telegram, unique: true
  end
end
