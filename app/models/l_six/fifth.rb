class LSix::Fifth < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged

  belongs_to :ls_first, class_name: 'LSix::First', foreign_key: :l_six_first_id
end
