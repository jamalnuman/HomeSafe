class UserJourney < ApplicationRecord

  validates :user_id, uniqueness: {scope: journey_id}


  belongs_to :user 
  belongs_to :journey
  belongs_to :ending_location, class_name: 'Location', optional: true
end
