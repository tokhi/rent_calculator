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
      return Float::NAN unless @params.present?

      @rents.inject { |sum, rent| sum + rent }.to_f / @rents.size
    end

    def estimation_params
      avg = average
      return { msg: I18n.t(:msg) } if avg.nan?

      { estimation: @params.merge(estimated_rent: avg) }
    end
  end
end
