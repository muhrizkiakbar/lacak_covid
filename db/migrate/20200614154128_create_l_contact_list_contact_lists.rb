class CreateLContactListContactLists < ActiveRecord::Migration[5.2]
  def change
    create_table :l_contact_list_contact_lists do |t|
      t.date :date_contact

      t.timestamps
    end
  end
end
