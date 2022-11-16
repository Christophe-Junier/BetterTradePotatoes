# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

Rails.logger.info '===== Generating Vegetable Seeds ====='
Vegetable.create(
  name: 'potatoe',
  daily_trade_limit: 100
)

Rails.logger.info '===== Generating Price Seeds ====='
50.times do
  Price.create(
    price: Faker::Number.number(digits: 5),
    value_date: Faker::Date.between(from: '2022-11-15', to: '2022-11-30'),
    vegetable_id: Vegetable.last.id
  )
end
