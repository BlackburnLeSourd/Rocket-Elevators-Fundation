class DropFactQuoteTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :fact_quotes
  end
end
