# Prob 8: Multiply Lists

# multiple two array elements together
# think easier with a loop
# take each index element of each array, and create a new array

def multiply_list(arr1, arr2)

  new_arr = []
  counter = 0
  
  loop do 
    new_arr << arr1[counter] * arr2[counter]
    counter += 1
    break if counter == arr1.size
  end

  new_arr
end


p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
