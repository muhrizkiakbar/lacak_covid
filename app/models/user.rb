class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :role
  
  has_many :close_contact_informations, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :user_id

  belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id
  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id
  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id
end
