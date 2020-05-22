# == Schema Information
#
# Table name: l_six_thirds
#
#  id                    :bigint           not null, primary key
#  date_nasopharyngeal   :date
#  place_nasopharyngeal  :string
#  result_nasopharyngeal :text
#  date_oropharyngeal    :date
#  place_oropharyngeal   :string
#  result_oropharyngeal  :text
#  date_sputum           :date
#  place_sputum          :string
#  result_sputum         :text
#  date_serum            :date
#  place_serum           :string
#  result_serum          :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  deleted_at            :datetime
#  l_six_first_id        :bigint
#
class LSix::Third < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  
  has_many :ls_t_checkothers, class_name: 'LSix::TCheckother', foreign_key: :l_six_third_id, dependent: :destroy

  belongs_to :ls_first, class_name: 'LSix::First', foreign_key: :l_six_first_id
end
