# Prob 5: Staggered Caps (Part 1)

# Go through the input, treat each space as a character
# Each other character gets capitalized or not 
# Can lowercase everything, then upcase when index is odd
# Then join them together again

def staggered_case(input)
  input = input.downcase
  new_arr = []
  
  input.chars.each_with_index do |char, idx|
    if idx % 2 == 1 || (!(('a'..'z').to_a).include?(char) && !(('A'..'Z').to_a).include?(char))
     new_arr << char
    else
    new_arr << char.capitalize!
    end
  end
  new_arr.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'