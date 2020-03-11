class Location < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :journeys, foreign_key: 'starting_location_id'
  has_many :user_journeys, foreign_key: 'ending_location_id'
  
end
