# frozen_string_literal: true

require 'test_helper'
module Services
  class CsvImportTest < ActiveSupport::TestCase
    setup do
      @csv_import = Services::CsvImport.new('test/fixtures/files/rents.csv', 'Apartment')
    end

    test 'should import csv data to apartment table' do
      result = @csv_import.call
      assert true, result > 0
    end
  end
end
