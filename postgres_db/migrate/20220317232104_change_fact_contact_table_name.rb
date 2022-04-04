class ChangeFactContactTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :fact_contact, :fact_contacts
  end
end
