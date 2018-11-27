# Official solution

# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new # initialize new hash
  1.upto(number_of_lights) { |number| lights[number] = "off" } # initially all lights are off
  lights # return hash
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth) # works for 1st, 2nd, 3rd, etc for all cases
  lights.each do |position, state| # for each key-value pair
    if position % nth == 0 # if position hits what the nth selection criteria is
      lights[position] = (state == "off") ? "on" : "off" # then switch is flipped
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)