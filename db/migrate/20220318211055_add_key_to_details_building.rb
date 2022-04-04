class AddKeyToDetailsBuilding < ActiveRecord::Migration[5.2]
  def change
    add_reference :detailsbuildings, :buildings, foreign_key: true
  end
end
