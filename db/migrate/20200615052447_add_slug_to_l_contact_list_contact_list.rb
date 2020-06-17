class AddSlugToLContactListContactList < ActiveRecord::Migration[5.2]
  def change
    add_column :l_contact_list_contact_lists, :slug, :string
    add_index :l_contact_list_contact_lists, :slug, unique: true
  end
end
