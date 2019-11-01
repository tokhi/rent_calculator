# frozen_string_literal: true

require 'csv'
module Services
  class CsvImport
    def initialize(file, model)
      @file = file
      @model = model
    end

    def call
      CSV.foreach(@file, headers: true) do |row|
        @model.create!(row.to_hash)
      end
    end
  end
end
