class ChangeTypeAuthor < ActiveRecord::Migration[5.2]
  def change
    change_column :interventions, :author, :string
  end
end
