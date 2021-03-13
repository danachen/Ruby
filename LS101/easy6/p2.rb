# Prob 2: Delete vowels

VOWELS = 'aeiouAEIOU'

def remove_vowels(input)

new_arr = []

  input.to_s.chars.each do |char|
    if VOWELS.include?(char)
      new_arr << ''
      # puts "no new addition of #{char}"
    else
      new_arr << char
      # puts "new addition of #{char}"
    end
  end
  new_arr.join
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']

# Official 

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end