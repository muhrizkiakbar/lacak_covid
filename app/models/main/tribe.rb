class Main::Tribe < ApplicationRecord 
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_tribe_id

  validates :tribe, presence: true, format: { with: /\w/, message: "Only input text."}
end
