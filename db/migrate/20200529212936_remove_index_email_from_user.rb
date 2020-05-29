class RemoveIndexEmailFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, name: "index_users_on_email"
    add_index :users, :email
    remove_index :users, name: "index_users_on_username"
    add_index :users, :username
  end

end
