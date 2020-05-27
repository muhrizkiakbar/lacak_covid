# == Schema Information
#
# Table name: l_six_fifths
#
#  id             :bigint           not null, primary key
#  l_six_first_id :bigint
#  name           :string
#  gender         :string
#  relation       :string
#  address        :text
#  phone_number   :string
#  activity       :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string
#  deleted_at     :datetime
#  age            :integer
#
class LSix::Fifth < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged

  belongs_to :ls_first, class_name: 'LSix::First', foreign_key: :l_six_first_id
end
