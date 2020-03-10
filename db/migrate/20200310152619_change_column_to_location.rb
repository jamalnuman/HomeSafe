class ChangeColumnToLocation < ActiveRecord::Migration[6.0]
  def change
    change_column :locations, :latitude, "numeric USING CAST(latitude AS numeric)"
    change_column :locations, :latitude, :decimal, precision: 8, scale: 6
  end
end
