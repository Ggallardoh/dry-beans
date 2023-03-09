class PickupSerializer
  include JSONAPI::Serializer

  attributes :sender, :address, :aasm_state, :picked_up_at

  belongs_to :trip
end