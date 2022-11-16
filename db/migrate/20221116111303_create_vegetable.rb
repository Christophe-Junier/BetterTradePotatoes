# frozen_string_literal: true

# Migration that Create the main table Vegetable
class CreateVegetable < ActiveRecord::Migration[7.0]
  def change
    create_table :vegetables do |t|
      t.string :name, null: false, index: { unique: true, name: 'unique_name' }
      t.integer :daily_trade_limit, null: false
      t.integer :current_stock, default: 0
      t.timestamps
    end
  end
end
