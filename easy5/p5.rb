# Prob 5: Clean up the words

# Given a string that consists of some words and an assortment of non-alphabetic characters, 
# write a method that returns that string with all of the non-alphabetic characters 
# replaced by spaces. If one or more non-alphabetic characters occur in a row, 
# you should only have one space in the result (the result should never have consecutive spaces).

# Note what needs cleaning up: first clean out duplicate characters
# Then replace the non-alphabetic chars with a space

def cleanup(input)

  new_string = []

  input.chars.each do |char|
    if char.match?(/[A-Z]/i) 
      new_string << char
    else
      new_string << ' '
    end
  end
  new_string.join.squeeze
end



p cleanup("---what's my +*& line?") #== ' what s my line '

# Officially
def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end