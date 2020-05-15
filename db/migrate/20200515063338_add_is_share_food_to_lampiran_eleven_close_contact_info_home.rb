class AddIsShareFoodToLampiranElevenCloseContactInfoHome < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_close_contact_info_homes, :is_share_food, :boolean
  end
end
