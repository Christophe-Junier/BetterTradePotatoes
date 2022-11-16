# frozen_string_literal: true

module Api
  module V1
    class VegetableSerializer
      include JSONAPI::Serializer

      attributes :name, :daily_trade_limit, :current_stock
    end
  end
end
