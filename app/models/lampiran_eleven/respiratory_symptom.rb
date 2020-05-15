# == Schema Information
#
# Table name: lampiran_eleven_respiratory_symptoms
#
#  id                                      :bigint           not null, primary key
#  lampiran_eleven_info_exposes_officer_id :bigint
#  is_sore_throat                          :boolean
#  date_of_sore_throat                     :date
#  is_cough                                :boolean
#  date_of_cough                           :date
#  is_flu                                  :boolean
#  date_of_flu                             :date
#  is_out_of_breath                        :boolean
#  date_of_out_of_breath                   :date
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  slug                                    :string
#  deleted_at                              :datetime
#
class LampiranEleven::RespiratorySymptom < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :info_exposes_officer, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :lampiran_eleven_info_exposes_officer_id
end
