# frozen_string_literal: true

class EstimationsController < ApplicationController
  before_action :set_apartment, only: %i[show update destroy]

  def index
    rents = Apartment.filter(params.slice(:zip_code, :apartment_size)).pluck(:rent)
    @estimation = Services::AverageRentEstimation.new(rents, params.slice(:apartment_size, :zip_code)).call
    render json:  @estimation
  end
end
