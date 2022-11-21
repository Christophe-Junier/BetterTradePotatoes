# frozen_string_literal: true

module Api
  module V1
    # Best Gain API controller
    class BestGainController < PricesController
      before_action :find_resource
      before_action :check_value_date_format

      def index
        @prices = @vegetable.prices.where(
          value_date: @value_date.beginning_of_day..@value_date.end_of_day
        ).order(value_date: :asc)

        return render json: { error: 'not enought datum to compute gain' }, status: :ok if @prices.size < 2

        best_unit_price = Price.profit_calculation(prices: @prices)
        data = {
          best_margin_per_unit: best_unit_price.last.to_f / 100,
          best_total_margin: (best_unit_price.last.to_f * @vegetable.daily_trade_limit.to_f) / 100,
          buying_date: best_unit_price.first,
          selling_date: Price.find_by(
            price: Price.find_by(value_date: best_unit_price.first).price + best_unit_price.last,
            value_date: best_unit_price.first...
          )&.value_date
        }

        render json: data.to_json, status: :ok
      end
    end
  end
end
