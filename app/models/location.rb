class Location < ApplicationRecord
  validates :name, presence: true #this is also tied to the create method in the controller ..on line 11
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?



  has_many :favorites
  has_many :users, through: :favorites
  has_many :journeys, foreign_key: 'starting_location_id' #remember the foreign_key is on the belongs_to and since the journey model doesnt have a place for the foreign key, we are designating the foreign key here..the foreign key would not usually be placed here, but should be in the journey model, which has the 'belongs to'
  has_many :user_journeys, foreign_key: 'ending_location_id'

  def latitude_longitude
    results = Geocoder.search(self.address) #'self' is referring to the instance of the location..@location
    self.latitude = results.first.coordinates[0]
    self.longitude = results.first.coordinates[1]
  end

  # def create_map
  #   self.map = "https://maps.googleapis.com/maps/api/staticmap?center=#{self.address}&size=300x300&zoom=17&markers=size:medium|color:brown|label:P|#{self.lat},#{self.lng}&key=#{Rails.application.credentials.google[:api_key]}"
  # end

  
end
