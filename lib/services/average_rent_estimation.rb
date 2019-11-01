# frozen_string_literal: true

module Services
  class AverageRentEstimation
    def initialize(rents, params)
      @rents = rents
      @params = params
    end

    def call
      estimation_params
    end

    def average
      @rents.inject { |sum, rent| sum + rent }.to_f / @rents.size
    end

    def estimation_params
      return { msg: I18n.t(:msg) } unless @params.present?

      { estimation: @params.merge(estimated_rent: average) }
    end
  end
end
