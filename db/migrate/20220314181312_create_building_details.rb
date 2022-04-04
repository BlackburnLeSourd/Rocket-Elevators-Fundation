class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.string :Building_ID
      t.string :Information_Key
      t.string :Value

      t.timestamps
    end
  end
end
