class AddStateToAdress < ActiveRecord::Migration[5.2]
  def change
    add_column :adresses, :state, :string
  end
end
