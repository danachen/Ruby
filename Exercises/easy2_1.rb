# From-To-Step Sequence Generator

# input: 3 integers, the starting value, ending value, step value applied to each iteration
# output: what's in the block
# return value: the new array that's returned
# algo: create a new array to hold the range of values

def step(beginning, ending, addition)
  
  new_arr = []
  
  loop do 
    yield(beginning) if block_given?
    new_arr << beginning
    beginning += addition 
    break if beginning > ending
  end
  new_arr
end

p step(1, 10, 3) { |value| "value = #{value}" }
p step(1, 10, 3).map { |element| element.to_s + 'a' }

# Output:

# value = 1
# value = 4
# value = 7
# value = 10