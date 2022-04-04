class ChangeFactQuoteDateDataType < ActiveRecord::Migration[5.2]
    def up
      change_table :fact_quotes do |t|
        t.change :createdOn, :datetime
      end
    end
  
    def down
      change_table :fact_contact do |t|
        t.change :createdOn, :date
      end
    end

end
