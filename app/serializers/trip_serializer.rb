class TripSerializer
  include JSONAPI::Serializer

  attributes :order
  has_many :pickups
  has_many :deliveries
end