class LampiranEleven::InformationExpose < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  

  has_one :close_contact, class_name: 'LampiranEleven::CloseContact', foreign_key: :lampiran_eleven_information_expose_id
  has_one :close_contact_info_home, class_name: 'LampiranEleven::CloseContactInfoHome', foreign_key: :lampiran_eleven_information_expose_id

  belongs_to :close_contact_information, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :lampiran_eleven_close_contact_information_id
  belongs_to :type_contact, class_name: 'Main::TypeContact', foreign_key: :main_type_contact_id
  belongs_to :set_location, class_name: 'Main::SetLocation', foreign_key: :main_set_location_id
end
