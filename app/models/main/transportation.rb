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

    scope :newest_first, -> { order(created_at: :desc) }
    
    def self.search options
        self.ransack(options)
    end

    has_many :close_contacts, class_name: 'LampiranEleven::CloseContact', foreign_key: :main_transportation_id

    validates :transportation, presence: true
end
