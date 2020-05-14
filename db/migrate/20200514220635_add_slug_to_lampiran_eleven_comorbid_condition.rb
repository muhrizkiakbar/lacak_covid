class AddSlugToLampiranElevenComorbidCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_comorbid_conditions, :slug, :string
    add_index :lampiran_eleven_comorbid_conditions, :slug, unique: true
  end
end
