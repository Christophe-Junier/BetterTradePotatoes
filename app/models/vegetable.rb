# frozen_string_literal: true

# t.string "name", null: false
# t.integer "daily_trade_limit", null: false
# t.integer "current_stock"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["name"], name: "unique_name", unique: true

# No id on this class, vegetable uniqueness and index are defined on name using unique_name

class Vegetable < ApplicationRecord
  validates :name, presence: { message: 'must be given please' }, uniqueness: { message: 'must be uniq please' }
  validates :daily_trade_limit, daily_trade_limit: { message: 'must be given please' }
  validates :current_stock, numericality: { greater_than_or_equal_to: 0 }
end
