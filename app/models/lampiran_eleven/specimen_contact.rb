class LampiranEleven::SpecimenContact < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :close_contact_information, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :lampiran_eleven_close_contact_information_id
end
