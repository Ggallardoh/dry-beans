# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    order { 1 }
    association :route

    after :create do |trip|
      create_list(:pickup, 3, trip: trip)
      create_list(:delivery, 2, trip: trip)
    end
  end
end
