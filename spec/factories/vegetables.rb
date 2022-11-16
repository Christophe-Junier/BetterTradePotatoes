# frozen_string_literal: true

FactoryBot.define do
  factory :vegetable do
    name { 'potatoe' }
    daily_trade_limit { 100 }
  end
end
