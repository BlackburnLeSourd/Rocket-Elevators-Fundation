class AddLatandLngToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :adresses, :latitude, :string
    add_column :adresses, :longitude, :string
  end
end
