class AddReferenceForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :customers, foreign_key: true
    add_reference :buildings, :adresses, foreign_key: true
    add_reference :customers, :users, foreign_key: true
    add_reference :building_details, :buildings, foreign_key: true
    add_reference :batteries, :buildings, foreign_key: true
    # add_reference :columns, :batteries, foreign_key: true
    # add_reference :elevators, :columns, foreign_key: true
  end
end
