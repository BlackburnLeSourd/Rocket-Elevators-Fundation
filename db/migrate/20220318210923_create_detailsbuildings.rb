class CreateDetailsbuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :detailsbuildings do |t|
      t.string :information_key
      t.string :value

      t.timestamps
    end
  end
end
