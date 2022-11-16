# frozen_string_literal: true

module Api
  module V1
    # Worst Loss API controller
    class WorstLossController < PricesController
      before_action :find_resource
      before_action :check_value_date_format

      def index
        @prices = @vegetable.prices.where(
          value_date: @value_date.beginning_of_day..@value_date.end_of_day
        ).select(:price, :value_date).order(value_date: :asc)

        return render json: { error: 'not enought datum to compute loss' }, status: :ok if @prices.size < 2

        worst_unit_price = Price.profit_calculation(prices: @prices, calculation_type: :loss)

        data = {
          worst_margin_price: worst_unit_price,
          worst_margin_with_daily_trade_limit: worst_unit_price * @vegetable.daily_trade_limit
        }
        render json: data.to_json, status: :ok
      end
    end
  end
end
