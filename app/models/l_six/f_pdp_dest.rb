# == Schema Information
#
# Table name: l_six_f_pdp_dests
#
#  id                :bigint           not null, primary key
#  name              :string
#  address           :text
#  relation          :string
#  date_contact      :date
#  last_date_contact :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string
#  deleted_at        :datetime
#
class LSix::FPdpDest < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  

  belongs_to :ls_fourth, class_name: 'LSix::Fourth', foreign_key: :l_six_fourth_id
end
