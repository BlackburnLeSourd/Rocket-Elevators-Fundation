class AddDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :interventions, :result, :string, :default => 'Incomplete'
    change_column :interventions, :status, :string, :default => 'Pending'
  end
end
