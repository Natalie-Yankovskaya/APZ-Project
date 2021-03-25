class Laundry < ApplicationRecord
  has_many :washers
  has_many :workers
end