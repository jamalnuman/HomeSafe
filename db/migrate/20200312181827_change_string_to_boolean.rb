class ChangeStringToBoolean < ActiveRecord::Migration[6.0]
  def change
        change_column :user_journeys, :completed, "integer USING completed::integer"
        change_column :user_journeys, :completed, :integer

  end
end
