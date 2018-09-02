require 'pstore'
require_relative "persons"
require 'geocoder'
NUM_PEOPLE = 10
array = []
i = 0
data_file = PStore.new('database.pstore')
data_file.transaction do
  array = data_file[:array]
end

array.each do |x|
  y = Woman.new
  y.name = x["name"]
  y.location = x["location"]
  y.gender = x["gender"]
  y.location_name = x["location_name"]
end

# Prompt user for location search
my_location = nil
puts "What location are you looking for?"
results = Geocoder.search("Sydney") #Change to gets.chomp
my_location = results.first.coordinates

# Find user with closest distance
distance_between = []
Woman.all.each {|x|
  distance_between << Woman.find_distance(my_location, x.location)
}

# Find closest distance for all users and match closest location amount with user array
Woman.all.each {|x|
  if distance_between.sort[0] == Woman.find_distance(my_location, x.location)
    puts "Your closest match is #{x.name} who lives in #{x.location_name}"
  end
}
