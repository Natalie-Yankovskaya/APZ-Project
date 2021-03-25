class Washing < ApplicationRecord
  has_many :services
  has_many :modes, through: :services
end