class EraseDuplicateCustomersIdInBuildings < ActiveRecord::Migration[5.2]
  def change
    remove_column(:buildings, :Customer_ID)
    remove_column(:columns, :batteryId)
    remove_column(:customers, :User_ID)
    remove_column(:elevators, :Column_ID)
    remove_column(:employees_users, :user_id)
    remove_column(:building_details, :Building_ID)
    remove_column(:batteries, :buildingId)
  end
end
