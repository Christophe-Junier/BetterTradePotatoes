# frozen_string_literal: true

# Main API controller
class ApplicationController < ActionController::API
  private

  def not_found
    render json: { error: 'resource not found' }, status: :not_found
  end

  def unprocessable_entity(message:)
    render json: { error: message }, status: :unprocessable_entity
  end
end
