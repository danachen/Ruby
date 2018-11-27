# Prob 9: Does My List Include This?

# Write a method named include? that takes an Array and a search value as arguments. 
# This method should return true if the search value is in the array, false if it is not. 
# You may not use the Array#include? method in your solution.

# Without using include, this has to follow the same logic as the last problem

def include?(arr, num)

  if arr.empty?
    return arr == num
  else 
    arr.find {|element| element == num} == num
  end

end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


