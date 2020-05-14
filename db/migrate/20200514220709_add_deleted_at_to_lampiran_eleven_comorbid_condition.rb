class AddDeletedAtToLampiranElevenComorbidCondition < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_comorbid_conditions, :deleted_at, :datetime
    add_index :lampiran_eleven_comorbid_conditions, :deleted_at
  end
end
