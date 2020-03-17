class Journey < ApplicationRecord
  has_many :user_journeys, dependent: :destroy #when a journey is destroyed, a user_journey is also destroyed  
  has_many :users, through: :user_journeys
  belongs_to :starting_location, class_name: 'Location'


end
