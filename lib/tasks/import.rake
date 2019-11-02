# frozen_string_literal: true

desc 'import csv data from a file'
task :import, %i[file_path option] => :environment do |_t, args|
  file = args[:option] == 'A' ? "#{args[:file_path]}-#{Time.now.strftime('%F')}.csv" : args[:file_path]
  puts "Importing CSV data from #{file} ..."
  Services::CsvImport.new(file, 'Apartment').call
  puts 'Done'
end
