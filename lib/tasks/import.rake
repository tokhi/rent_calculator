desc 'import csv data from a file'
task :import, [:file_path] => :environment do |t, args|
  puts "Importing CSV data..."
  result =  Services::CsvImport.new(args[:file_path],'Apartment').call
  puts "Rows Inserted: #{result}"
end