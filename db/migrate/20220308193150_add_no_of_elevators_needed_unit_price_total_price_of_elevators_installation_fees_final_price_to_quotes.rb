class AddNoOfElevatorsNeededUnitPriceTotalPriceOfElevatorsInstallationFeesFinalPriceToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :no_of_elevators_needed, :integer
    add_column :quotes, :unit_price, :integer
    add_column :quotes, :total_price_of_elevators, :integer
    add_column :quotes, :installation_fees, :integer
    add_column :quotes, :final_price, :integer
  end
end
