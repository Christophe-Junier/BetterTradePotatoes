# frozen_string_literal: true

module Api
  module V1
    # Vegetable API controller
    class VegetablesController < ApplicationController
      before_action :find_resource, only: %w[show]

      def index
        render json: Api::V1::VegetableSerializer.new(Vegetable.all).serializable_hash.to_json, status: :ok
      end

      def show
        raise
      end

      private

      def find_resource
        if (@vegetable = Vegetable.find_by(name: params[:name].downcase)).present?
          render json: Api::V1::VegetableSerializer.new(@vegetable).serializable_hash.to_json, status: :ok
        else
          render json: { error: 'resource not found' }, status: :not_found
        end
      end
    end
  end
end
