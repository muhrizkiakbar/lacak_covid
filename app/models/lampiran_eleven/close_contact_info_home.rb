class LampiranEleven::CloseContactInfoHome < ApplicationRecord
  belongs_to :information_expose, class_name: 'LampiranEleven::InformationExpose', foreign_key: :lampiran_eleven_close_contact_info_home_id
end
