# frozen_string_literal: true

desc 'import csv data from a file'
task :import, [:file_path] => :environment do |_t, args|
  puts 'Importing CSV data...'
  Services::CsvImport.new(args[:file_path], 'Apartment').call
  puts 'Done'
end
