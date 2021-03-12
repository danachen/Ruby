# Prob 7: Halvsies

# Write a method that takes an Array as an argument, and returns two Arrays that 
# contain the first half and second half of the original Array, respectively. 
# If the original array contains an odd number of elements, the middle element 
# should be placed in the first half Array.

# to play with the index or size of the array, 0..size/2.to_i will always give the first half more

def halvsies(arr)
  sizing = (arr.size.to_f / 2).ceil
  first, second = arr[0..sizing-1], arr[sizing.. -1]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

