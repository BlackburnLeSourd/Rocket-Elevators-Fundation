class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :adress
    has_many :buildings
end
