class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.string :product_line
      t.integer :no_of_apartments
      t.integer :no_of_floors
      t.integer :no_of_basements
      t.integer :no_of_businesses
      t.integer :no_of_parking_spaces
      t.integer :no_of_elevator_cages
      t.integer :max_of_occupants_per_floor
      t.integer :no_of_hours_of_activities

      t.timestamps
    end
  end
end
