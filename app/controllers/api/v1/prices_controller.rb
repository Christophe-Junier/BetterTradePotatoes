# frozen_string_literal: true

module Api
  module V1
    # Prices API controller
    class PricesController < ApplicationController
      before_action :find_resource
      before_action :check_value_date_format, only: %w[show]

      def index
        @prices = @vegetable.prices
        render json: Api::V1::PricesSerializer.new(@prices).serializable_hash.to_json, status: :ok
      end

      def show
        @prices = @vegetable.prices.where(
          value_date: @value_date.beginning_of_day..@value_date.end_of_day
        ).order(value_date: :asc)
        render json: Api::V1::PricesSerializer.new(@prices).serializable_hash.to_json, status: :ok
      end

      private

      def find_resource
        not_found if (@vegetable = Vegetable.find_by(name: params[:vegetable_name].downcase)).blank?
      end

      def check_value_date_format
        @value_date = (params[:value_date] || params[:price_value_date]).to_date
      rescue StandardError
        unprocessable_entity(message: 'invalid date, please use a YYYY-MM-DD format')
      end
    end
  end
end
