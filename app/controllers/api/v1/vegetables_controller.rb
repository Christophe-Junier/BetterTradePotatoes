# frozen_string_literal: true

# Vegetable API controller
class Api::V1::VegetablesController < ApplicationController
  before_action :find_resource, only: %i[show]

  def index; end

  def show; end
end
