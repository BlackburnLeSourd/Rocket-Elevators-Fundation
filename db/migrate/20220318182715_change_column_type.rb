class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :Company_headquarters_adress, :text
  end
end
