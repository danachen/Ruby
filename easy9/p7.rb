# Prob 7: Name Swapping

def swap_name(input)

  new_arr = input.split
  new_arr[0], new_arr[1] = new_arr[1], new_arr[0] 
  new_arr.join(', ')

end

p swap_name('Joe Roberts') == 'Roberts, Joe'
