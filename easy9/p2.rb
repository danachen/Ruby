# Prob 2: Double Doubles

# A double number is a number with an even number of digits whose left-side 
# digits are exactly the same as its right-side digits. 
# For example, 44, 3333, 103103, 7676 are all double numbers. 
# 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, 
# unless the argument is a double number; double numbers should be returned as-is.

# is it a double number? -> how to determine a double number?
# if is, return as is
# if not, double the number

# to calculate a double number?
# digits has to be even
# if numbers are cut in half, the first half == second half


def is_number_double?(input)
  
  # p input.to_s.size/2-1
  # p input.to_s.size/2

  if input.to_s.size.even? == true && 
     input.to_s[0..input.to_s.size/2-1] == input.to_s[input.to_s.size/2..-1]
    true
  else
    false
  end 
end


def twice(num)
  
  if is_number_double?(num) == true
    num
  else
    num*2
  end

end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103

p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10