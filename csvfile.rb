require "csv"
  CSV.open("file.csv", "w") do |csv|
    csv << ["1", "2"]
    csv << ["4", "5"]
  end

require 'csv'
  file_new = CSV.read('file.csv')
  puts file_new
  CSV.open("file_new.csv" , "w") do |csv|
    csv << file_new.shift
  end
