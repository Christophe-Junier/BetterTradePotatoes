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
        render json: Api::V1::VegetableSerializer.new(@vegetable).serializable_hash.to_json, status: :ok
      end

      private

      def find_resource
        not_found if (@vegetable = Vegetable.find_by(name: params[:name].downcase)).blank?
      end
    end
  end
end
