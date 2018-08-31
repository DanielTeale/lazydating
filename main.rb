require_relative "persons"
# require 'geocoder'
NUM_PEOPLE = 10
array = []
i = 0
for i in (0..NUM_PEOPLE) do
  array << Person.new
end

my_location = nil
puts "What location are you looking for?"
results = Geocoder.search(gets.chomp)
my_location = results.first.coordinates
# puts my_location

distance_between = []
Person.all.each {|x|
  distance_between << Person.find_distance(my_location, x.location).round
}

Person.all.each {|x|
  if distance_between.sort[0] == Person.find_distance(my_location, x.location).round

    puts "Your closest match is #{x.name} who lives in #{Geocoder.search(x.location).first.address}"
  end 
}
