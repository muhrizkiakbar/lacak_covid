class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :resource
      t.string :action
      t.string :path
      t.string :description
      t.boolean :page

      t.timestamps
    end
  end
end
