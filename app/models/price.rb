# frozen_string_literal: true

# t.references :vegetable
# t.bigint :price, null: false
# t.datetime :value_date, null: false
# t.timestamps
class Price < ApplicationRecord
  # Validations
  validates :value_date, presence: { message: 'must be given please' }
  validates :price, presence: { message: 'must be given please' }, numericality: { greater_than_or_equal_to: 0 }

  # Relations
  belongs_to :vegetable

  # Scopes

  # Callbacks

  # Class methods

  def self.profit_calculation(prices:, calculation_type: :profit)
    value_hash = {}
    prices.each do |price|
      value_hash[price.value_date] = []
      value_hash[price.value_date] << difference_array(compute_price: price.price, prices: prices.where(value_date: price.value_date...).pluck(:price))
    end
    calculation_type == :profit ? hashes_array_max_value(value_hash) : hashes_array_min_value(value_hash)
  end

  def self.difference_array(compute_price:, prices:)
    difference_array = []
    prices.each do |price|
      difference_array << price - compute_price
    end
    difference_array.sort
  end

  def self.hashes_array_max_value(hash)
    max = [hash.first.first, hash.first.second.flatten.max]
    hash.each do |key, value|
      max = [key, value.flatten.max] if value.flatten.max > max.second
    end
    max
  end

  def self.hashes_array_min_value(hash)
    min = [hash.first.first, hash.first.second.flatten.min]
    hash.each do |key, value|
      min = [key, value.flatten.min] if value.flatten.min < min.second
    end
    min
  end

  # OLD METHOD, here to compare with new
  # def self.profit_calculation(prices:, calculation_type: :profit)
  #   profit_array = generate_profit_array(prices:)
  #
  #   case calculation_type
  #   when :profit
  #     profit_array.max.to_f / 100
  #   when :loss
  #     profit_array.min.to_f / 100
  #   else
  #     profit_array
  #   end
  # end

  # OLD METHOD, here to compare with new
  # def self.generate_profit_array(prices:, profit_array: [])
  #   calculation_prices = prices.pluck(:price)
  #   initialisation_prices = prices.pluck(:price)
  #   initialisation_prices.each do |initialisation_price|
  #     calculation_prices.map do |calculation_price|
  #       next if calculation_price == initialisation_price
  #
  #       profit_array << calculation_price - initialisation_price
  #     end
  #     calculation_prices.shift
  #   end
  #   profit_array
  # end

  # Instance methods
  def human_readable_price
    price / 100
  end
end
