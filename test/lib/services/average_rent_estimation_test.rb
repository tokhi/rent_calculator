# frozen_string_literal: true

require 'test_helper'
module Services
  class AverageRentEstimationTest < ActiveSupport::TestCase
    setup do
      @rent_prices = [20, 34, 58, 62, 35, 40, 62, 60]
      @are = Services::AverageRentEstimation.new(@rent_prices, apartment_size: 55, zip_code: '1234')
    end
    test 'should return the right average price' do
      assert_equal @are.average, (@rent_prices.sum / @rent_prices.size.to_f)
    end

    test 'should return the right estimation' do
      assert_equal @are.call, estimation: { apartment_size: 55, zip_code: '1234', estimated_rent: 46.375 }
    end
  end
end
