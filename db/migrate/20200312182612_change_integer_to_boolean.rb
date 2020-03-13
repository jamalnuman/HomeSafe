class ChangeIntegerToBoolean < ActiveRecord::Migration[6.0]
  def change
    change_column :user_journeys, :completed, "boolean USING completed::boolean"
    change_column :user_journeys, :completed, :boolean
  end
end
