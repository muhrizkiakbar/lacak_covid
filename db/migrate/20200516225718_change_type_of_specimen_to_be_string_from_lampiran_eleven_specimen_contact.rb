class ChangeTypeOfSpecimenToBeStringFromLampiranElevenSpecimenContact < ActiveRecord::Migration[5.2]
  def change
    change_column :lampiran_eleven_specimen_contacts, :type_of_specimen, :string
  end
end
