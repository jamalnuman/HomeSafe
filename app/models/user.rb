class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :favorites
  has_many :locations, through: :favorites

  has_many :user_journeys
  has_many :journeys, through: :user_journeys
end
