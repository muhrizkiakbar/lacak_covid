# == Schema Information
#
# Table name: main_transportations
#
#  id             :bigint           not null, primary key
#  transportation :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  deleted_at     :datetime
#  slug           :string
#
class Main::Transportation < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged
    

    validates :transportation, presence: true
end
