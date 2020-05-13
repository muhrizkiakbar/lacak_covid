class Main::JobType < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged


  validates :job_type, presence: true, format: { with: /\w/, message: "Only input text."}
end
