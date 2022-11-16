# frozen_string_literal: true

# Main API controller
class ApplicationController < ActionController::API
  private

  def not_found
    render json: { error: 'resource not found' }, status: :not_found
  end
end
