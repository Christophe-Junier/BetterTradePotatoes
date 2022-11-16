# frozen_string_literal: true

# t.string "name", null: false
# t.integer "daily_trade_limit", null: false
# t.integer "current_stock"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["name"], name: "unique_name", unique: true
class Vegetable < ApplicationRecord
  # Validations
  validates :name, presence: { message: 'must be given please' }, uniqueness: { message: 'must be uniq please' }
  validates :daily_trade_limit, presence: { message: 'must be given please' },
                                numericality: { greater_than_or_equal_to: 0 }
  validates :current_stock, numericality: { greater_than_or_equal_to: 0 }

  # Relations
  has_many :prices, dependent: :destroy

  # Scopes

  # Callbacks
  before_validation :ensure_name_is_formatted

  private

  # Class methods

  # Instance methods
  def ensure_name_is_formatted
    self.name = name.downcase.strip.parameterize
  end
end
