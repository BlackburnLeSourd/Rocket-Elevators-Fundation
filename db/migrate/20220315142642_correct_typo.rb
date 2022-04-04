class CorrectTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :buildings, :Tecknical_contact_phone_for_the_building, :Technical_contact_phone_for_the_building
  end
end
