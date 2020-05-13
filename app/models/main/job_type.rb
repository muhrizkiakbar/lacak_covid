# == Schema Information
#
# Table name: main_job_types
#
#  id         :bigint           not null, primary key
#  job_type   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  slug       :string
#
class Main::JobType < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged


    has_many :close_contacts, class_name: 'LampiranEleven::CloseContact', foreign_key: :main_job_type_id

  validates :job_type, presence: true
end
