class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :name, :fiance_name, :wedding_date, presence: true

  has_many :checklists
  has_many :tasks
  has_many :guests
  has_many :expenses
end
