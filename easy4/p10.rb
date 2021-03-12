# Prob 10: Convert a Signed Number to a String!

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

def signed_integer_to_string(input)
  output = ''
  if input < 0
    input = input * -1
    output = integer_to_string(input).prepend('-')
  elsif input > 0
    output = integer_to_string(input).prepend('+')
  else
    0.to_s
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'