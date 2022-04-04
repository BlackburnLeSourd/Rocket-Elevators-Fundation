class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :User_ID
      t.string :Customers_Creation_Date
      t.string :Company_Name
      t.string :Company_headquarters_adress
      t.string :Full_Name_of_the_company_contact
      t.string :Company_contact_phone
      t.string :Email_of_the_company_contact
      t.string :Company_Description
      t.string :Full_Name_of_servive_Technical_Authority
      t.string :Technical_Manager_Email_for_Servive
      t.string :Technical_Manager_Email_for_Service

      t.timestamps
    end
  end
end
