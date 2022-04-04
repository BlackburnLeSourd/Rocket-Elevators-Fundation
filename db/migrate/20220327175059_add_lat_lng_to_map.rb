class AddLatLngToMap < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :latitude, :string
    add_column :maps, :longitude, :string
  end
end
