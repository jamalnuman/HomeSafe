class CreateUserJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :user_journeys do |t|
      t.integer :ending_location_id
      t.integer :user_id
      t.integer :journey_id
      t.bit :completed

      t.timestamps
    end
  end
end
