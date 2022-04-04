class AddFullNameToMigration < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :fullName, :string
    add_column :quotes, :phone, :string
    add_column :quotes, :department, :string
    add_column :quotes, :projectName, :string
    add_column :quotes, :projectDesc, :string
    add_column :quotes, :message, :string
  end
end
