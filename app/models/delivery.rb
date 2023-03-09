class Delivery < ApplicationRecord
  include AASM

  belongs_to :trip

  validates :recipient, :address, presence: true

  aasm  do
    state :pending, initial: true
    state :delivered

    event :deliver do
      transitions from: :pending, to: :delivered
    end
  end
end
