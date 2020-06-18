# == Schema Information
#
# Table name: l_contact_list_contact_patients
#
#  id                             :bigint           not null, primary key
#  main_patient_id                :bigint
#  main_patient_child_id          :bigint
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  l_contact_list_contact_list_id :bigint
#
class LContactList::ContactPatient < ApplicationRecord
  # belongs_to :main_patient
  # belongs_to :main_patient_child
  #
  belongs_to :contact_list, class_name: 'LContactList::ContactList', foreign_key: :l_contact_list_contact_patient_id
  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :l_contact_list_contact_patient_id
  belongs_to :patient_child, class_name: 'Main::Patient', foreign_key: :l_contact_list_contact_patient_child_id
end
