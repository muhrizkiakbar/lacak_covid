# == Schema Information
#
# Table name: l_six_t_checkothers
#
#  id                 :bigint           not null, primary key
#  l_six_third_id     :bigint
#  other_check        :string
#  date_check_other   :date
#  place_check_other  :string
#  result_check_other :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string
#  deleted_at         :datetime
#
class LSix::TCheckother < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  

  scope :this_month, -> { where(interview_date: Time.now.beginning_of_month..Time.now.end_of_month) }

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  

  belongs_to :ls_third, class_name: 'LSix::Third', foreign_key: :l_six_third_id
end
