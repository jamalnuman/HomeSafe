class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
