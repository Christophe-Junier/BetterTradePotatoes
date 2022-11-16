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
    profit_array = generate_profit_array(prices:)

    case calculation_type
    when :profit
      profit_array.max.to_f / 100
    when :loss
      profit_array.min.to_f / 100
    else
      profit_array
    end
  end

  def self.generate_profit_array(prices:, profit_array: [])
    calculation_prices = prices.pluck(:price)
    initialisation_prices = prices.pluck(:price)
    initialisation_prices.each do |initialisation_price|
      calculation_prices.map do |calculation_price|
        next if calculation_price == initialisation_price

        profit_array << calculation_price - initialisation_price
      end
      calculation_prices.shift
    end
    profit_array
  end

  # Instance methods
  def human_readable_price
    price / 100
  end
end
