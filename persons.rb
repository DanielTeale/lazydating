require 'geocoder'
require 'faker'

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
      @people.count
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

class Men < Person
  attr_accessor :name, :gender
  def initialize
    super
    @name = "#{Faker::Name.male_first_name} #{Faker::Name.last_name}"
    @gender = "Male"
    self.class.all << self
  end
  @men = []
  class << self
    def all
      @men
    end

    def count
      @men.count
    end
  end
end

