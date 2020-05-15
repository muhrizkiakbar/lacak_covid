# == Schema Information
#
# Table name: lampiran_eleven_comorbid_conditions
#
#  id                                           :bigint           not null, primary key
#  lampiran_eleven_close_contact_information_id :bigint
#  is_cancer                                    :boolean
#  is_diabetes                                  :boolean
#  is_ppok                                      :boolean
#  is_hiv                                       :boolean
#  is_liver                                     :boolean
#  is_obesity                                   :boolean
#  is_asthma                                    :boolean
#  is_blood_disorder                            :boolean
#  is_heart_disease                             :boolean
#  is_kidney                                    :boolean
#  is_neurology                                 :boolean
#  is_organ_donor_recipient                     :boolean
#  is_pregnant                                  :boolean
#  is_first_semester_pregnant                   :boolean
#  is_second_semester_pregnant                  :boolean
#  is_third_semester_pregnant                   :boolean
#  estimated_birth                              :date
#  is_influenza_vaccine                         :boolean
#  date_of_influenza_vaccine                    :date
#  influenza_vaccine_in_the_country             :string
#  is_pvc_vaccine                               :boolean
#  date_of_pvc_vaccine                          :date
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  slug                                         :string
#  deleted_at                                   :datetime
#
class LampiranEleven::ComorbidCondition < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :close_contact_information, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :lampiran_eleven_close_contact_information_id
end
