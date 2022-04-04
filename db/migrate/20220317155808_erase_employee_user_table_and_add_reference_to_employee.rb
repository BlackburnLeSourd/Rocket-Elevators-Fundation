class EraseEmployeeUserTableAndAddReferenceToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :adresses, :customers, foreign_key: true
    add_reference :adresses, :buildings, foreign_key: true
    add_reference :employees, :users, foreign_key: true

    drop_table :employees_users
  end
end
