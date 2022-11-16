# frozen_string_literal: true

module Api
  module V1
    class PricesSerializer
      include JSONAPI::Serializer

      set_id :value_date
      attributes :value_date, :price
    end
  end
end
