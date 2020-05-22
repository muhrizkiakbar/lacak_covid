# == Schema Information
#
# Table name: l_six_fourths
#
#  id                           :bigint           not null, primary key
#  l_six_first_id               :bigint
#  abroad                       :decimal(, )
#  out_town                     :decimal(, )
#  hospital                     :decimal(, )
#  animal_market                :decimal(, )
#  contact_pdp                  :decimal(, )
#  contact_positive             :decimal(, )
#  ispa_chronic                 :decimal(, )
#  medic_officer                :decimal(, )
#  explain_of_procedure_alcohol :text
#  is_goggle                    :boolean
#  isn_apd                      :boolean
#  is_n99_ffp3                  :boolean
#  is_n95_ffp2                  :boolean
#  is_gloves                    :boolean
#  is_medic_mask                :boolean
#  is_gown                      :boolean
#  is_procedure                 :boolean
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  slug                         :string
#  deleted_at                   :datetime
#
class LSix::Fourth < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  

#  abroad                       :decimal(, )
#  out_town                     :decimal(, )
#  hospital                     :decimal(, )
#  animal_market                :decimal(, )
#  contact_pdp                  :decimal(, )
#  contact_positive             :decimal(, )
#  medic_officer                :decimal(, )
  enum abroad: [:tidak, :tidak_tahu, :ya], _prefix: :abroad
  enum out_town: [:tidak, :tidak_tahu, :ya], _prefix: :out_town
  enum hospital: [:tidak, :tidak_tahu, :ya], _prefix: :hospital
  enum animal_market: [:tidak, :tidak_tahu, :ya], _prefix: :animal_market
  enum contact_pdp: [:tidak, :tidak_tahu, :ya], _prefix: :contact_pdp
  enum contact_positive: [:tidak, :tidak_tahu, :ya], _prefix: :contact_positive
  enum medic_officer: [:tidak, :tidak_tahu, :ya], _prefix: :medic_officer
  enum ispa_chronic: [:tidak, :tidak_tahu, :ya], _prefix: :ispa_chronic

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  
  has_one :ls_f_aboard_dest, class_name: 'LSix::FAboardDest', foreign_key: :l_six_four_id, dependent: :destroy
  has_one :ls_f_animal_dest, class_name: 'LSix::FAnimalDest', foreign_key: :l_six_four_id, dependent: :destroy
  has_one :ls_f_hospital_dest, class_name: 'LSix::FHospitalDest', foreign_key: :l_six_four_id, dependent: :destroy
  has_one :ls_f_out_town_dest, class_name: 'LSix::FOutTownDest', foreign_key: :l_six_four_id, dependent: :destroy
  has_one :ls_f_pdp_dest, class_name: 'LSix::FPdPDest', foreign_key: :l_six_four_id, dependent: :destroy
  has_one :ls_f_positive_dest, class_name: 'LSix::FPositiveDest', foreign_key: :l_six_four_id, dependent: :destroy

  belongs_to :ls_first, class_name: 'LSix::First', foreign_key: :l_six_first_id
end
