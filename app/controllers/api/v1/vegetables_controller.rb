# frozen_string_literal: true

module Api
  module V1
    # Vegetable API controller
    class VegetablesController < ApplicationController
      before_action :find_resource, only: %w[show]

      def index; end

      def show; end

      private

      def find_resource
        raise
      end
    end
  end
end
