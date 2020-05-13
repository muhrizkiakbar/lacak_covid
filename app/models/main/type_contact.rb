class Main::TypeContact < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged


  validates :type_contact, presence: true, format: { with: /\w/, message: "Only input text."}
end
