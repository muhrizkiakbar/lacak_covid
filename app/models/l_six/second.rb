# == Schema Information
#
# Table name: l_six_seconds
#
#  id                        :bigint           not null, primary key
#  l_six_first_id            :bigint
#  main_hospital_id          :bigint
#  since_date_symptom        :date
#  fever_temperature         :decimal(, )
#  history_fever             :boolean
#  cough                     :decimal(, )
#  cold                      :decimal(, )
#  sore_throat               :decimal(, )
#  headache                  :decimal(, )
#  weak                      :decimal(, )
#  muscle_ache               :decimal(, )
#  nausea_vomitting          :decimal(, )
#  abdominal_pain            :decimal(, )
#  diarrhea                  :decimal(, )
#  other_symptom             :string
#  is_pregnant               :boolean
#  is_diabetes               :boolean
#  is_heart_disease          :boolean
#  is_hypertention           :boolean
#  is_malignancy             :boolean
#  is_kidney_disease         :boolean
#  is_liver_disease          :boolean
#  is_immune_disease         :boolean
#  is_ppok                   :boolean
#  other_condition           :string
#  is_being_treated_hospital :boolean
#  last_date_hospital        :date
#  room_treated              :string
#  is_treated_icu            :boolean
#  is_intubation             :boolean
#  is_emco                   :boolean
#  last_hospital             :text
#  last_status_patient       :string
#  date_of_die               :date
#  pneumonia                 :decimal(, )
#  ardc                      :decimal(, )
#  other_diagnose            :text
#  have_etiologi             :decimal(, )
#  explain_etiologi          :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  deleted_at                :datetime
#  slug                      :string
#  out_of_breath             :decimal(, )
#
class LSix::Second < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  
  enum cough: [:tidak, :tidak_tahu, :ya], _prefix: :cough
  enum cold: [:tidak, :tidak_tahu, :ya], _prefix: :cold
  enum sore_throat: [:tidak, :tidak_tahu, :ya], _prefix: :sore_throat
  enum headache: [:tidak, :tidak_tahu, :ya], _prefix: :headache
  enum weak: [:tidak, :tidak_tahu, :ya], _prefix: :weak
  enum muscle_ache: [:tidak, :tidak_tahu, :ya], _prefix: :muscle_ache
  enum nausea_vomitting: [:tidak, :tidak_tahu, :ya], _prefix: :nausea_vomitting
  enum abdominal_pain: [:tidak, :tidak_tahu, :ya], _prefix: :abdominal_pain
  enum diarrhea: [:tidak, :tidak_tahu, :ya], _prefix: :diarrhea
  enum pneumonia: [:tidak, :tidak_tahu, :ya], _prefix: :pneumonia
  enum ardc: [:tidak, :tidak_tahu, :ya], _prefix: :ardc
  enum have_etiologi: [:tidak, :tidak_tahu, :ya], _prefix: :have_etiologi
  enum out_of_breath: [:tidak, :tidak_tahu, :ya], _prefix: :out_of_breath


  enum last_status_patient: {"Sembuh" => "sembuh", "Masih Sakit" => "sakit", "Meninggal Dunia" => "meninggal"}

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  
  # has_one :first, class_name: 'LSix::Second', foreign_key: :l_six_first_id, dependent: :destroy

  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id, optional: true
  belongs_to :ls_first, class_name: 'LSix::First', foreign_key: :l_six_first_id
end
