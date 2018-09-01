require 'pstore'
require_relative 'persons'

NUM_PEOPLE = 10
array = []
i = 0
for i in (0..NUM_PEOPLE) do
  object = Woman.new
  # Store in hash for PStore
  hash = Hash.new
  hash["name"] = object.name
  hash['location'] = object.location
  hash['location_name'] = nil
  hash['gender'] = object.gender
  # Generate new location until real location is returned
  while hash['location_name'] == nil
    hash['location'] = [Faker::Address.latitude, Faker::Address.longitude]
    var = Geocoder.search(hash['location'])
    hash['location_name'] = var.first.address
  end
  
  array << hash
end

data_file = PStore.new('database.pstore')
data_file.transaction do
  data_file[:array] = array
end


