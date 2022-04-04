class FixReferences < ActiveRecord::Migration[5.2]
  def change
    # adresses table
    remove_column :adresses, :customers_id

    # batteries table
    remove_column :batteries, :buildings_id
    add_reference :batteries, :building, foreign_key: true
    remove_column :batteries, :employeeId
    add_reference :batteries, :employee

    # building_details table
    drop_table :building_details

    # buildingdetails table
    #drop_table :buildingdetails

    # buildings table
    remove_column :buildings, :customers_id
    remove_column :buildings, :adresses_id
    add_reference :buildings, :customer, foreign_key: true
    add_reference :buildings, :adress, foreign_key: true
    remove_column :buildings, :Adress_of_the_building

    # columns table
    add_reference :columns, :battery, foreign_key: true

    # customers table
    remove_column :customers, :users_id
    add_reference :customers, :user, foreign_key: true
    remove_column :customers, :Company_headquarters_adress
    remove_column :customers, :city
    add_reference :customers, :adress, foreign_key: true

    # detailsbuildings table
    remove_column :detailsbuildings, :buildings_id
    add_reference :detailsbuildings, :building, foreign_key: true

    # elevators table
    add_reference :elevators, :column, foreign_key: true

    # employees table
    remove_column :employees, :users_id
    add_reference :employees, :user, foreign_key: true    

  end
end
