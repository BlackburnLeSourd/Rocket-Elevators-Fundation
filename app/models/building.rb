class Building < ApplicationRecord
    belongs_to :customer
    belongs_to :adress
    has_many :detailsbuildings
    has_many :batteries
end
