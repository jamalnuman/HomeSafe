class Journey < ApplicationRecord
  has_many :user_journeys
  has_many :users, through: :user_journeys
  belongs_to :starting_location, class_name: 'Location'


end
