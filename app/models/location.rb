class Location < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :journeys, foriegn_key: 'starting_location_id'
  has_many :user_journeys, foriegn_key: 'ending_location_id'
  
end
