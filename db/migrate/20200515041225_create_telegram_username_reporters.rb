class CreateTelegramUsernameReporters < ActiveRecord::Migration[5.2]
  def change
    create_table :telegram_username_reporters do |t|
      t.references :main_city, foreign_key: true
      t.references :main_district, foreign_key: true
      t.references :main_sub_district, foreign_key: true
      t.references :main_citizen_association, foreign_key: true, index: {:name => "index_m_citizen_association_on_t_username_reporter"}
      t.references :main_neighborhood_association, foreign_key: true, index: {:name => "index_m_neighborhood_association_on_t_username_reporter"}
      t.string :username_telegram
      t.datetime :last_activity_at

      t.timestamps
    end
    add_index :telegram_username_reporters, :username_telegram, unique: true
  end
end
