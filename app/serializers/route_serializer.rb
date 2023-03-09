class RouteSerializer
  include JSONAPI::Serializer

  attributes :name
  has_many :trips
end