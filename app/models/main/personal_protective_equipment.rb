class Main::PersonalProtectiveEquipment < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId
  
    friendly_id :slug_candidates, use: :slugged

  validates :personal_protective_equipment, presence: true
end
