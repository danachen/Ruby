# Prob 4: Reversed Arrays (Part 1)

# Write a method that takes an Array as an argument, and reverses its elements in place; 
# that is, mutate the Array passed into this method. 
# The return value should be the same Array object.

# need to use map and return the same array
# mutate the array without using reverse method
# what is the best way to insert elements in place? take the last element and unshift it
# to the front seems to be the best
# loop?

def reverse!(arr)

counter = 0

  loop do 
    break if counter == arr.size / 2
    arr[counter], arr[arr.size - counter - 1] = arr[arr.size - counter - 1], arr[counter]
    counter += 1
  end
  arr
end

# list = [1,2,3,4]
# p reverse!(list) # => [4,3,2,1]

# list == [4, 3, 2, 1]
# list.object_id == result.object_id

# list = %w(a b c d e)
# p reverse!(list) # => ["e", "d", "c", "b", "a"]
# list == ["e", "d", "c", "b", "a"]

# list = ['abc']
# p reverse!(list) # => ["abc"]
# list == ["abc"]

# list = []
# p reverse!(list) # => []
# list == []