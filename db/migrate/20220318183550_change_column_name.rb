class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :columns, :type, :set_type
  end
end
