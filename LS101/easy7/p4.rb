# Prob 4: Swap Case

def swapcase(input)
  input_arr = input.chars

  input_arr.map do |char|
    if (('A'..'Z').to_a).include?(char)
      char = char.downcase!
    elsif (('a'..'z').to_a).include?(char)
      char = char.upcase!
    end
  end
  input_arr.join
end



p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
