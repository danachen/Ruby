# Prob 6: Running Totals

# Write a method that takes an Array of numbers, and returns an Array with the same 
# number of elements, and each element has the running total from the original Array.

# this seems like something #map can do, while running the iteration, change the original
# #map doesn't quite work index of the number before itself doesn't work
#

# def running_total(arr)

# counter = 0
# new_arr = [] 
# new_arr << arr[counter] if !arr.empty?

#   loop do 
#     break if counter == arr.size - 1 || arr.empty?
#     new_arr << new_arr[counter] + arr[counter + 1]
#     counter += 1
#   end

#   new_arr
# end


p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Official 
def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end