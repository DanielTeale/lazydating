require 'geocoder'
require 'faker'

class Person
  attr_accessor :name, :location
  def initialize
    @name = Faker::Name.name
    @location = [Faker::Address.latitude , Faker::Address.longitude]
    self.class.all << self
  end
  @people = []
  class << self
    
    def all
      @people
    end
    
    def count
      @people.cound
    end

    def find_distance(location1, location2)
      Geocoder::Calculations.distance_between(location1, location2)
    end
  end
end
