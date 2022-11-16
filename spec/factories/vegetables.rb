# frozen_string_literal: true

FactoryBot.define do
  factory :vegetable do
    name { Faker::Food.vegetables }
    daily_trade_limit { Faker::Number.between(from: 1, to: 100) }
  end
end
