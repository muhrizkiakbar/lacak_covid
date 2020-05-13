# == Schema Information
#
# Table name: main_marital_statuses
#
#  id             :bigint           not null, primary key
#  marital_status :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string
#  deleted_at     :datetime
#
class Main::MaritalStatus < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :patients, class_name: 'Main::Patient', foreign_key: :main_marital_status_id

  validates :marital_status, presence: true
end
