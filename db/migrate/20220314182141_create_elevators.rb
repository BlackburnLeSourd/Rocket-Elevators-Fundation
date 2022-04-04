class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :Column_ID
      t.string :Serial_number
      t.string :Model
      t.string :Type
      t.string :Status
      t.string :Date_of_commissioning
      t.string :Date_of_last_inspection
      t.string :Certificate_of_inspection
      t.string :Information
      t.string :Notes

      t.timestamps
    end
  end
end
