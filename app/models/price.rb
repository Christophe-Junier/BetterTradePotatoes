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

  private

  # Class methods

  # Instance methods
  def human_readable_price
    price / 100
  end
end
