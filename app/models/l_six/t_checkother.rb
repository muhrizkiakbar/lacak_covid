class LSix::TCheckother < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  

  scope :this_month, -> { where(interview_date: Time.now.beginning_of_month..Time.now.end_of_month) }

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  

  belongs_to :ls_third, class_name: 'LSix::First', foreign_key: :l_six_third_id
end
