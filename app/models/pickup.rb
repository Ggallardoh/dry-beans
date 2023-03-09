class Pickup < ApplicationRecord
  include AASM

  belongs_to :trip

  validates :sender, :address, presence: true

  aasm  do
    state :pending, initial: true
    state :picked_up

    event :pick_up do
      transitions from: :pending, to: :picked_up
    end
  end
end
