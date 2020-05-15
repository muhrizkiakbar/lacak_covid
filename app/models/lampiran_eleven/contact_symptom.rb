# == Schema Information
#
# Table name: lampiran_eleven_contact_symptoms
#
#  id                                      :bigint           not null, primary key
#  lampiran_eleven_info_exposes_officer_id :bigint
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  slug                                    :string
#  deleted_at                              :datetime
#  is_contact_experiencing_pain            :boolean
#  is_fever                                :boolean
#  is_ili                                  :boolean
#  explain_of_fever                        :text
#  date_of_symptom                         :date
#  status_asymptomatic                     :boolean
#
class LampiranEleven::ContactSymptom < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :info_exposes_officer, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :lampiran_eleven_info_exposes_officer_id
end
