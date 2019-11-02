# frozen_string_literal: true

class EstimationsController < ApplicationController
  before_action :set_apartment, only: %i[show update destroy]

  def index
    rents = Apartment.filter(estimation_params).pluck(:rent)
    @estimation = Services::AverageRentEstimation.new(rents, params.slice(:apartment_size, :zip_code)).call
    render json:  @estimation, status: @estimation[:msg].present? ? 404 : 200
  end

  private

  def estimation_params
    params.permit(:zip_code, :apartment_size)
  end
end
