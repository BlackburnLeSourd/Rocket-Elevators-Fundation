class ChangeSuiteDataTypeInAdress < ActiveRecord::Migration[5.2]
    def self.up
      change_table :adresses do |t|
        t.change :suite_or_appartment, :string
      end
    end
    def self.down
      change_table :adresses do |t|
        t.change :suite_or_appartment, :integer
      end
    end
end
