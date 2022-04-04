class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :cie_name
      t.string :email
      t.string :phone
      t.string :project_name
      t.string :project_description
      t.string :department_in_charge
      t.string :message
      t.mediumblob :attached_files

      t.timestamps
    end
  end
end
