class ChangeDataTypeForTotalPriceOfElevators < ActiveRecord::Migration[5.2]
  def change
    def self.up
      change_table :quotes do |t|
        t.change :total_price_of_elevators, :float
      end
    end
    def self.down
      change_table :quotes do |t|
        t.change :total_price_of_elevators, :integer
      end
    end
  end
end
