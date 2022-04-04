class DropHomesTable < ActiveRecord::Migration[5.2]
  def down
    drop_table :homes

  end
end
