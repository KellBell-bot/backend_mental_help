# require 'roo'

# namespace :import do
#   desc "Import practitioner data from spreadsheet"
#   task data: :environment do
#     puts "Importing data"

#     data= Roo::Spreadsheet.open('lib/data.xlsx') #opens spreadsheet
#     headers = data.row(1) #get header row
#     byebug
#     data.each_with_index do |row, idx|
#       next if idx == 0 #skips the header while mapping

#       practitioner_data = Hash[[headers, row].transpose]

#       practitioner = Practitioner.create(practitioner_data)
#     end
#   end

# end
