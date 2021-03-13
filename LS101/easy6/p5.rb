# Prob 5: Reversed Arrays (Part 2)

# Write a method that takes an Array, and returns a new Array with the elements of the 
# original list in reverse order. Do not modify the original list.

# the only difference is that a new array is allowed! much easier

def reverse(arr)

new_arr = []

  arr.each do |element|
    new_arr.unshift(element)
  end
  new_arr

end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true

