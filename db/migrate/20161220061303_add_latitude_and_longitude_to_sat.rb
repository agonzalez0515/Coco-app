class AddLatitudeAndLongitudeToSat < ActiveRecord::Migration[5.0]
  def change
    add_column :sats, :latitude, :float
    add_column :sats, :longitude, :float
  end
end
