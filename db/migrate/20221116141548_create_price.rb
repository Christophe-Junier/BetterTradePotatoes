# frozen_string_literal: true

# Migration that Create the main table Price
class CreatePrice < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.references :vegetable
      t.bigint :price, null: false
      t.datetime :value_date, null: false
      t.timestamps
    end
  end
end
