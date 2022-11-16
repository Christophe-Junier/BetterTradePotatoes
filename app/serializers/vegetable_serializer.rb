# frozen_string_literal: true

class VegetableSerializer
  include JSONAPI::Serializer

  attributes :name, :daily_trade_limit, :current_stock
end
