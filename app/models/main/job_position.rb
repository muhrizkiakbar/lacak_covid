class Main::JobPosition < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :info_exposes_officer, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :main_job_position_id

end
