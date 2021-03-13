# Prob 2: Rotation (Part 2)

# Write a method that can rotate the last n digits of a number. For example:
#Note that rotating just 1 digit results in the original number being returned.

def rotate_array(arr)
  arr_new = arr.clone
  arr_new.push(arr_new[0]).shift
  arr_new.join
end

def rotate_rightmost_digits(num, digit)

  to_rotate = num.to_s[-digit..-1].chars

  if digit == num.to_s.size
    new_digit = rotate_array(to_rotate).to_i
  else 
    new_digit = (num.to_s[0..num.to_s.size-digit-1] + rotate_array(to_rotate).to_s).to_i
  end
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']


