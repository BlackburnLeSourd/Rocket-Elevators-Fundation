class Drop < ActiveRecord::Migration[5.2]
  def down
    drop_table :indexpages

  end
end
