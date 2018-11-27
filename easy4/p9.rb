# Prob 9: Convert a Number to a String!
# Write a method that takes a positive integer or zero, and converts it to a string representation.

def integer_to_string(int)

  arr_int = []

  while int >= 0
    temp_num = int % 10
    arr_int.unshift(temp_num)
    int /= 10
    break if int <= 0
  end

  arr_int.join
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end