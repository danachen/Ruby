# Prob 8: Double Char (Part 2)

# Only double the consonants, not the vowels, and not the spaces

def double_consonants(str)

  new_string = []

  str.chars.each do |char|
    if ('aeiouAEIOU').include?(char) == false
      new_string << char*2 
    else 
      new_string << char
    end
  end

  new_string.join
end

p double_consonants('String') #== "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""