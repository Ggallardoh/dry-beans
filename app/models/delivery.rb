class Delivery < ApplicationRecord
  include AASM

  belongs_to :trip

  validates :recipient, :address, presence: true

  aasm  do
    state :pending, initial: true
    state :delivered, :canceled

    event :deliver do
      transitions from: :pending, to: :delivered
    end
    event :cancel do
      transitions from :pending, to: :canceled
    end
  end
end
