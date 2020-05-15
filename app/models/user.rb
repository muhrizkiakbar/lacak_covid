# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  username                     :string           default(""), not null
#  email                        :string           default(""), not null
#  encrypted_password           :string           default(""), not null
#  main_dinkes_province_id      :bigint
#  main_dinkes_region_id        :bigint
#  main_hospital_id             :bigint
#  main_public_health_center_id :bigint
#  reset_password_token         :string
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :inet
#  last_sign_in_ip              :inet
#  failed_attempts              :integer          default(0), not null
#  unlock_token                 :string
#  locked_at                    :datetime
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  slug                         :string
#  deleted_at                   :datetime
#  role_id                      :bigint
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :registerable
  devise :database_authenticatable, :rememberable, :validatable
  
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  
  belongs_to :role

  has_many :username_observers, class_name: 'LampiranEleven::UsernameObserver', foreign_key: :user_id
  
  has_many :close_contact_informations, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :user_id

  belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id
  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id
  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id


  attr_writer :login

  def login
    @login || self.username || self.email
  end
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :username,:name, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end     
end
