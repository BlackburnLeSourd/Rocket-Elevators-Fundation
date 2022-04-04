class CreateJoinTablesEmployeeUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :employees, :users do |t|
      t.string [:employee_email, :user_email]
      t.string [:user_email, :employee_email]
    end
  end
end
