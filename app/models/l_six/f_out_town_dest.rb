class LSix::FOutTownDest < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  

  belongs_to :ls_fourth, class_name: 'LSix::Fourth', foreign_key: :l_six_fourth_id
end
