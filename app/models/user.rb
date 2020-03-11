class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true

  validates :phone_number, presence: true, uniqueness: true

  has_many :favorites
  has_many :locations, through: :favorites

  has_many :user_journeys
  has_many :journeys, through: :user_journeys
end
