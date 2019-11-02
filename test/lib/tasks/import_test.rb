# frozen_string_literal: true

require 'test_helper'
require 'rake'

class Import < ActiveSupport::TestCase
  def setup
    RentCalculator::Application.load_tasks
    Rake.application.invoke_task('import[test/fixtures/files/rents.csv,M]')
  end

  test 'should import csv data' do
    assert_equal true, Apartment.count > 0
  end
end
