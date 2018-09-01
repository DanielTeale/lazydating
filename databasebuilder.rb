require 'pstore'
require_relative 'persons'
require_relative '../periodic-table/filereadmethods.rb'

NUM_PEOPLE = 10
array = []
i = 0
for i in (0..NUM_PEOPLE) do
  object = Woman.new
  hash = Hash.new
  hash["name"] = object.name
  hash['location'] = object.location
  var = Geocoder.search(object.location)
  hash['location_name'] = var.first.coordinates
  hash['gender'] = object.gender
  array << hash
end

# # array.each do |x|
data_file = PStore.new('database.pstore')
data_file.transaction do
  data_file[:array] = array
end


# array =  (Woman.all).inspect
# append_to_file 'database.txt', array

# hash = read_from_file("database.txt")
# hash = hash[0]
# i=0
# hash.each do |x|
#   hash = x
  