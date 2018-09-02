require 'geocoder'
require 'faker'
require 'haversine'

class Person
  attr_accessor :location, :location_name
  def initialize
    @location = [Faker::Address.latitude , Faker::Address.longitude]
    @location_name = nil
    self.class.all << self
  end
  @people = []
  class << self
    
    def all
      @people
      self
    end
    
    def count
      @people.cound
    end

    def find_distance(location1, location2)
      Geocoder::Calculations.distance_between(location1, location2)
    end
  end
end

class Woman < Person
  attr_accessor :name, :gender
  def initialize
    super
    @name = "#{Faker::Name.female_first_name} #{Faker::Name.last_name}"
    @gender = "Female"
    self.class.all << self
  end
  @women = []
  class << self
    def all
      @women
    end

    def count
      @women.count
    end
  end
end