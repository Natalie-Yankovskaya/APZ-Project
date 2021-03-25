class Mode < ApplicationRecord
  has_many :services
  has_many :washings, through: :services
end