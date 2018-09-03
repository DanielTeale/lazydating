require 'pstore'
require_relative "persons"
require 'geocoder'

data_file = PStore.new('database.pstore')
data_file.transaction do
  $men = data_file[:men]
  $woman = data_file[:woman]
end

$woman.each do |x|
  y = Woman.new
  y.name = x["name"]
  y.location = x["location"]
  y.gender = x["gender"]
  y.location_name = x["location_name"]
end

$men.each do |x|
  y = Men.new
  y.name = x["name"]
  y.location = x["location"]
  y.gender = x["gender"]
  y.location_name = x["location_name"]
end
# Prompt user for location search
my_location = nil
puts "Welcome lazy dater!"
puts "What location are you looking for?"
results = Geocoder.search(gets.chomp) #Change to gets.chomp
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
    abort
  end
}
