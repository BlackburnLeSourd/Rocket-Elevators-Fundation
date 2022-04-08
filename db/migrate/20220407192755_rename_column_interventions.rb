class RenameColumnInterventions < ActiveRecord::Migration[5.2]
  def change
    rename_column :interventions, :custumerID, :customerID
  end
end
