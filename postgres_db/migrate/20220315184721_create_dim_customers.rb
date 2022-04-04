class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.datetime :createdOn
      t.string :companyName
      t.string :fullNameOfMainContact
      t.string :emailOfMainContact
      t.integer :nbElevator
      t.string :customerCity

      t.timestamps
    end
  end
end
