class CreateFactContactTable < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contact do |t|
      t.integer :contactId
      t.datetime :createdOn
      t.string :companyName
      t.string :email
      t.string :projectName

      t.timestamps
    end
  end
end
