# == Schema Information
#
# Table name: main_neighborhood_associations
#
#  id                          :bigint           not null, primary key
#  neighborhood_association    :string
#  main_citizen_association_id :bigint
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  slug                        :string
#  deleted_at                  :datetime
#
class Main::NeighborhoodAssociation < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  def self.search options
    self.ransack(options)
  end

  has_many :username_reporters, class_name: 'Telegram::UsernameReporters', foreign_key: :main_neighborhood_association_id

  belongs_to :citizen_association, class_name: 'Main::CitizenAssociation', foreign_key: :main_citizen_association_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_neighborhood_association_id

  validates :neighborhood_association, presence: true, length: { is: 3 }, numericality: { only_integer: true }
end
