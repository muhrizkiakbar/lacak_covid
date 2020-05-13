class CreateMainTribes < ActiveRecord::Migration[5.2]
  def change
    create_table :main_tribes do |t|
      t.string :tribe

      t.timestamps
    end
  end
end
