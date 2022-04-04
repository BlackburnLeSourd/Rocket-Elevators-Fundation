class ChangeDataTypeForQuoteColumns < ActiveRecord::Migration[5.2]
  def change
    def self.up
      change_table :quotes do |t|
        t.change :total_price_of_elevators, :float
        t.change :installation_fees, :float
        t.change :final_price, :float
      end
    end
    def self.down
      change_table :quotes do |t|
        t.change :total_price_of_elevators, :integer
        t.change :installation_fees, :integer
        t.change :final_price, :integer
      end
    end
  end
end
