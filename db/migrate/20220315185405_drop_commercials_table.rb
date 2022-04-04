class DropCommercialsTable < ActiveRecord::Migration[5.2]
  def down
    drop_table :commercials

  end
end
