class ChangeBitToBoolean < ActiveRecord::Migration[6.0]
  def change
    change_column :user_journeys, :completed, :string
  end
end
