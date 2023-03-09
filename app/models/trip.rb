class Trip < ApplicationRecord
  belongs_to :route
  has_many :deliveries
  has_many :pickups
end
