# Prob 4: 1000 Lights

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


# when n=1, every light is on [true, true, true, true, true]
  # when n is 2, 2, 4, 6, 8, is turned
  # when n is 3, 3, 6, 9 is turned
  # when n is 4, 4, 8 is turned
  # when n is 5, 5, 10 is turned

def turn_lights_on(n)

  switch_on = true
  lights_state = Array.new(n, switch_on)
  iteration_counter = 0

  loop do 
    puts "loop #{iteration_counter}"
 
    lights_state.map do |element|
      element = !switch_on
      p element
    end

    iteration_counter +=1 
    break if iteration_counter > n
    
  end
end
p turn_lights_on(5)






