class ChangeLongitudeToLocations < ActiveRecord::Migration[6.0]
  def change
    change_column :locations, :longitude, "numeric USING CAST(longitude AS numeric)"
    change_column :locations, :longitude, :decimal, precision: 9, scale: 6
  end
end
