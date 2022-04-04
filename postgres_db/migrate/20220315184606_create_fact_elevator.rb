class CreateFactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.integer :serialNumber
      t.datetime :dateOfCommissioning
      t.integer :buildingId
      t.integer :customerId
      t.string :buildingCity

      t.timestamps
    end
  end
end
