class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author
      t.bigint :custumerID
      t.bigint :buildingID
      t.bigint :batteryID
      t.bigint :columnID
      t.bigint :elevatorID
      t.bigint :employeeID
      t.datetime :start_Date_And_Time_Of_The_Intervention
      t.datetime :end_Date_And_Time_Of_The_Intervention
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end
