class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :type_of_adress
      t.string :status
      t.string :entity
      t.string :number_and_street
      t.integer :suite_or_appartment
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :notes

      t.timestamps
    end
  end
end
