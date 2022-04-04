class AddFloorNumberToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :No_of_floors, :integer
  end
end
