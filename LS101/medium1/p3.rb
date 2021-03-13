# Prob 3: Rotation (Part 3)

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

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# 735291, 7-35291
# 35291-7, 3-52917
# 3-2917-5, 32-9175
# 321-75-9, 321-759
# 321-59-7, 3215-97
# 3215-7-9, 32157-9
# 321579

def max_rotation(input)

  digi = input.to_s.size
  
  loop do 
    input = rotate_rightmost_digits(input, digi)
    digi -= 1
    break if digi == 0
  end
  input
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845