# == Schema Information
#
# Table name: main_job_positions
#
#  id           :bigint           not null, primary key
#  job_position :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  deleted_at   :datetime
#
class Main::JobPosition < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :info_exposes_officer, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :main_job_position_id


    def self.search options
        self.ransack(options)
    end
end
