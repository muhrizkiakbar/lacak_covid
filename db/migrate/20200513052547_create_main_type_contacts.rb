class CreateMainTypeContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :main_type_contacts do |t|
      t.string :type_contact

      t.timestamps
    end
  end
end
