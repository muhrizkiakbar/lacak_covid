# == Schema Information
#
# Table name: l_contact_list_contact_lists
#
#  id              :bigint           not null, primary key
#  date_contact    :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  main_patient_id :bigint
#  slug            :string
#
class LContactList::ContactList < ApplicationRecord
    
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    has_many :contact_patients, class_name: 'LContactList::ContactList', foreign_key: :l_contact_list_contact_list_id
    belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id

    validates :date_contact, :main_patient_id, presence: true
end
