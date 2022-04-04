class DropFactQuotesTable < ActiveRecord::Migration[5.2]
  def down
    drop_table :fact_quotes

  end
end
