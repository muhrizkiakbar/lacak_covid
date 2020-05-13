class Main::MaritalStatus < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :patients, class_name: 'Main::Patient', foreign_key: :main_marital_status_id

  validates :marital_status, presence: true, format: { with: /\w/, message: "Only input text."}
end
