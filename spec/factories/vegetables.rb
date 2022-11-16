# frozen_string_literal: true

FactoryBot.define do
  factory :vegetable do
    name { 'Potatoe' }
    daily_trade_limit { 100 }
  end
end
