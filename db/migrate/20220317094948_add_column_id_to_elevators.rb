class AddColumnIdToElevators < ActiveRecord::Migration[5.2]
  def change
    add_index :elevators, :column_id
  end
end
