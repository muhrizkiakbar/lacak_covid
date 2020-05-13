class CreateMainProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :main_provinces do |t|
      t.string :province

      t.timestamps
    end
  end
end
