class Main::TypeContact < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged


  validates :type_contact, presence: true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: "Only input character."}
end
