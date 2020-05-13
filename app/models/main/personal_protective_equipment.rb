# == Schema Information
#
# Table name: main_personal_protective_equipments
#
#  id                            :bigint           not null, primary key
#  personal_protective_equipment :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  slug                          :string
#  deleted_at                    :datetime
#
class Main::PersonalProtectiveEquipment < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId
  
    friendly_id :slug_candidates, use: :slugged

  validates :personal_protective_equipment, presence: true
end
