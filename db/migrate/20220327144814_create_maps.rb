class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :location_of_the_building
      t.integer :no_of_floors_in_the_building
      t.string :client_name
      t.integer :no_of_batteries
      t.integer :no_of_columns
      t.integer :no_of_elevators
      t.string :full_name_of_technical_contact

      t.timestamps
    end
  end
end
