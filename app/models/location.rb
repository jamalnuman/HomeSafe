class Location < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?



  has_many :favorites
  has_many :users, through: :favorites
  has_many :journeys, foreign_key: 'starting_location_id'
  has_many :user_journeys, foreign_key: 'ending_location_id'

  def latitude_longitude
    results = Geocoder.search(self.address)
    self.latitude = results.first.coordinates[0]
    self.longitude = results.first.coordinates[1]
  end

  def create_map
    self.map = "https://maps.googleapis.com/maps/api/staticmap?center=#{self.address}&size=300x300&zoom=17&markers=size:medium|color:brown|label:P|#{self.lat},#{self.lng}&key=#{Rails.application.credentials.google[:api_key]}"
  end

  
end
