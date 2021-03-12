# Prob 7: Convert a String to a Number!

# Write a method that takes a String of digits, and returns the appropriate number as an integer. 
# You may not use any of the methods mentioned above like to_i.

# How to convert strings into integers? Break strings into chars, take each char and then what?
# took a peek at the solution, it's by using a hash to assign values

HSH = { '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9, '0'=>0}

def string_to_integer(str)
  str_arr = str.chars
  int_arr = []

  str_arr.each do |char|

    if HSH.has_key?(char)
      int_arr << HSH[char]
    end
  end

# how to construct the integer again from a number of digits, 4, 3, 2, 1
# 1 + 2*10 + 3*100 + 4*1000 
  size_digit = int_arr.size
  final_integer = 0

  int_arr.each.with_index do |digit, idx|
    final_integer += digit * 10**(size_digit - 1 - idx) 
  end
  final_integer
end


p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570
p string_to_integer('16542') #== 16542


# Official solution

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end