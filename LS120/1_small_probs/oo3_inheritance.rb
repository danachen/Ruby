# OO Basics: Inheritance

# 3.1 Inherited Year
# Using the following code, create two classes - Truck and Car - that both inherit from Vehicle.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# car1 = Car.new(2006)
# puts car1.year

# 3.2 Start the Engine (Part 1) ***
# Change the following code so that creating a new Truck automatically invokes #start_engine.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
  
#   def initialize(year)    # still have to reference the argument
#     super                 # need to get the super in
#     start_engine
#   end
  
#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# 3.3 Only Pass the Year ***

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   attr_accessor :bed_type
#   def initialize (year, bed_type)
#     super(year)     # only thing missing was passing only one parameter to the super
#     @bed_type = bed_type
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'Short')
# puts truck1.year
# puts truck1.bed_type

# 3.4 Start the Engine (Part 2) ** no arguments in super

# Given the following code, modify #start_engine in Truck by appending 
# 'Drive fast, please!' to the return value of #start_engine in Vehicle. 
# The 'fast' in 'Drive fast, please!' should be the value of speed.

# class Vehicle
#   def start_engine(speed)
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   def start_engine(speed)
#     super() + "Drive #{speed}, please!"
#   end
# end

# truck1 = Truck.new
# puts truck1.start_engine('fast')

# 3.5 Towable (Part 1)

# module Towable
#   def tow
#     puts "I can tow a trailer!"
#   end
# end

# class Truck
#   include Towable
# end

# class Car
# end

# truck1 = Truck.new
# truck1.tow

# 3.6 Towable (Part 2)

# module Towable
#   def tow
#     'I can tow a trailer!'
#   end
# end

# class Vehicle
#   attr_accessor :year
#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   include Towable
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow

# car1 = Car.new(2006)
# puts car1.year

# 3.7 Method Lookup (Part 1)

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# # cat1.color
# p Cat.ancestors     # Cat -> Animal, stops here when it's found

# 3.8 Method Lookup (Part 2)

# class Animal
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new
# cat1.color.ancestors # Cat -> Animal -> Object -> Kernal -> BasicOBject

# 3.9 Method Lookup (Part 3)

# module Flyable
#   def fly
#     "I'm flying!"
#   end
# end

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
#   include Flyable
# end

# bird1 = Bird.new('Red')
# bird1.color     # Bird -> Flyable -> Animal (found in Animal)

# 3.10 Transportation

module Transportation

  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end

end

Transportation::Truck.new # this is to instantitate a class contained in a module





