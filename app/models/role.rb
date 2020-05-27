# == Schema Information
#
# Table name: roles
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  deleted_at              :datetime
#  is_show_to_all          :boolean
#  is_surveilance          :boolean
#  is_public_health_center :boolean
#  is_dinkes_region        :boolean
#  is_dinkes_province      :boolean
#
class Role < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  validates :name, presence: true


  #relasi antar table
  has_many :users
  has_many :role_permissions
  #relasi untuk akses table ke permission tanpa harus menggunakan access_roles
  has_many :permissions, through: :role_permissions
  #========================
end
