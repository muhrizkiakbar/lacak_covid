# == Schema Information
#
# Table name: main_type_contacts
#
#  id           :bigint           not null, primary key
#  type_contact :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  deleted_at   :datetime
#  slug         :string
#
class Main::TypeContact < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

  has_many :information_exposes, class_name: 'LampiranEleven::InformationExpose', foreign_key: :main_type_contact_id

  validates :type_contact, presence: true
end
