# == Schema Information
#
# Table name: lampiran_eleven_specimen_contacts
#
#  id                                           :bigint           not null, primary key
#  lampiran_eleven_close_contact_information_id :bigint
#  type_of_specimen                             :string
#  date_of_specimen_collection                  :date
#  laboratory_examination_results               :text
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  slug                                         :string
#  deleted_at                                   :datetime
#
class LampiranEleven::SpecimenContact < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId


  enum type_of_specimen: {"Nasal Swab" => "swab", "Swab Tenggorok" => "tenggorok", "Nasopharyngeal swab" => "nasopharyngeal", "Orofaringeal swab" => "orofaringeal","Serum" => "serum"}

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :close_contact_information, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :lampiran_eleven_close_contact_information_id
end
