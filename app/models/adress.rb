class Adress < ApplicationRecord
    has_one :customer
    has_one :building
end