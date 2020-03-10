class CreateJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :journeys do |t|
      t.integer :starting_location_id

      t.timestamps
    end
  end
end
