class AddColumnToMainPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :main_patients, :encrypted_no_identity, :string
    add_column :main_patients, :encrypted_no_identity_iv, :string

    add_index :main_patients, :encrypted_no_identity_iv, unique: true

    add_column :main_patients, :encrypted_name, :string
    add_column :main_patients, :encrypted_name_iv, :string

    add_index :main_patients, :encrypted_name_iv, unique: true

  end
end
