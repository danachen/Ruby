# Prob 8: 



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


def string_to_signed_integer(input)

  input_n = input.delete('^A-Za-z0-9')

  if input.include?('-')
    string_to_integer(input_n)* -1
  else
    string_to_integer(input_n)
  end

end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
