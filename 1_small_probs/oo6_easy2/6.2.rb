# Fix the Program - Drivable

module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
p bobs_car.drive
