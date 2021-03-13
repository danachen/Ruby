# Buggy Code - Car Mileage

class Car
  attr_accessor :mileage #setter, getter class methods, and instance variables created

  def initialize # every time an object is instantiated, this runs and mileage
    @mileage = 0  # instance varialbe is assigned 0
  end

  def increment_mileage(miles)  # method that passes in parameter in miles
    self.mileage = @mileage + miles # instance variable mileage is reassigned value
  end

  def print_mileage     # mileage is the method here, which gets instance variable @mileage
    puts mileage        # so printing either mileage or @mileage will be the same
  end
end

car = Car.new     # new object is instantiated
car.mileage = 5000  # object method #mileage called on object car, value of 5000 assigned through setter
car.increment_mileage(678)  #method i_m invoked, with argument passed
car.print_mileage  # should print 5678