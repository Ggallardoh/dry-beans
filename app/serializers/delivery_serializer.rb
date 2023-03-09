class DeliverySerializer
  include JSONAPI::Serializer

  attributes :recipient, :address, :aasm_state, :delivered_at
end