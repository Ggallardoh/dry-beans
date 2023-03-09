# frozen_string_literal: true

FactoryBot.define do
  factory :route do
    name { Faker::Coffee.blend_name }
    after :create do |route|
      create_list(:trip, 2, route: route)
    end
  end
end
