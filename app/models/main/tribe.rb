# == Schema Information
#
# Table name: main_tribes
#
#  id         :bigint           not null, primary key
#  tribe      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  slug       :string
#
class Main::Tribe < ApplicationRecord 
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_tribe_id

  validates :tribe, presence: true
end
