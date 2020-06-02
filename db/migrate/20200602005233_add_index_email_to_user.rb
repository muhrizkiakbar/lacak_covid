class AddIndexEmailToUser < ActiveRecord::Migration[5.2]
  def change

    # remove_index :users, name: "index_users_on_email"
    rename_index :users, 'index_users_on_email', 'index_users_on_email_old'
    
    add_index :users, :email,                unique: true
  end
end
