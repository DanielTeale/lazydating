require 'pstore'
require_relative 'persons'

NUM_PEOPLE = 10
woman = []
men = []
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
  woman << hash
end

i = 0
for i in (0..NUM_PEOPLE) do
  object = Men.new
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
  
  men << hash
end

data_file = PStore.new('database.pstore')
data_file.transaction do
  data_file[:men] = men
  data_file[:woman] = woman
end


