# frozen_string_literal: true

FactoryBot.define do
  factory :pickup do
    sender { Faker::Name }
    address { Faker::Address }
    aasm_state { 'pending' }
    association :trip
  end
end
