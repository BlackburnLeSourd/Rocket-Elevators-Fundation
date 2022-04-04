class CreateFactIntervention < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
        t.integer :employeeID
        t.integer :buildingID
        t.integer :batteryID
        t.integer :columnID
        t.integer :elevatorID
        t.datetime :start_Date_And_Time_Of_the_Intervention
        t.datetime :end_Date_And_Time_Of_The_Intervention
        t.string :result
        t.string :report
        t.string :status

        t.timestamps
    end
  end
end
