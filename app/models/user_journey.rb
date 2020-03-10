class UserJourney < ApplicationRecord
  belongs_to :user 
  belongs_to :journey
  belongs_to :ending_location, class_name: 'Location', optional: true
end
