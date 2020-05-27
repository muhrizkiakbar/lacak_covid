# == Schema Information
#
# Table name: l_six_f_animal_dests
#
#  id              :bigint           not null, primary key
#  l_six_fourth_id :bigint
#  location        :string
#  city            :string
#  visit_date      :date
#  province_city   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  deleted_at      :datetime
#
class LSix::FAnimalDest < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  

  belongs_to :ls_fourth, class_name: 'LSix::Fourth', foreign_key: :l_six_fourth_id
end
