# frozen_string_literal: true

require 'csv'
module Services
  class CsvImport
    def initialize(file, klass)
      @file = file
      @klass = klass.constantize
    end

    def call
      CSV.foreach(@file, headers: true) do |row|
        @klass.create!(row.to_hash)
      end
    rescue Exception => e
      "Error: #{e}"
    end
  end
end
