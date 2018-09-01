require 'pstore'
require_relative "persons"
# require 'geocoder'
NUM_PEOPLE = 10
array = []
i = 0
data_file = PStore.new('database.pstore')
data_file.transaction do
  array = data_file[:array]
end

# puts array
# for i in (0..NUM_PEOPLE) do
#   array << Woman.new
#   # array << 
# end

my_location = nil
puts "What location are you looking for?"
results = Geocoder.search("Sydney") #Change to gets.chomp
my_location = results.first.coordinates
# puts my_location

distance_between = []
Woman.all.each {|x|
  distance_between << Woman.find_distance(my_location, x.location)
}
# system 'clear'


Woman.all.each {|x|
  if distance_between.sort[0] == Woman.find_distance(my_location, x.location)
    # p location = Geocoder.search(x.location)
    # p loaction = location.first.address
    
    
    puts "Your closest match is #{x.name} who lives in #{Geocoder.search(x.location)}"
  end
}
