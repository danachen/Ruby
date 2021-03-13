# Prob one: Rotation (Part 1)

# Write a method that rotates an array by moving the first element to the end of the array. 
# The original array should not be modified.

def rotate_array(arr)

arr_new = arr.clone
arr_new.push(arr_new[0]).shift
arr_new
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

