class RemoveBuildingIdFromAdresses < ActiveRecord::Migration[5.2]
  def change
    remove_column(:adresses, :buildings_id)
  end
end
