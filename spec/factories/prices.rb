# frozen_string_literal: true

FactoryBot.define do
  factory :price do
    value_date { Faker::Date.between(from: '2022-11-15', to: '2022-11-30') }
    price { Faker::Number.number(digits: 5) }
    association :vegetable
  end
end
