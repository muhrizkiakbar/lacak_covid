class CreateMainDinkesProvinces < ActiveRecord::Migration[5.2]
  def change
    create_table :main_dinkes_provinces do |t|
      t.string :dinkes_province

      t.timestamps
    end
  end
end
