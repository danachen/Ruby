# Prob 6: Letter Counter (Part 1)

# Write a method that takes a string with one or more space separated 
# words and returns a hash that shows the number of words of different sizes.

# have to turn the input of characters/words into a hash of word length count and occurrences

def word_sizes(input)

  occurrences = Hash.new(0)

  input.split.each do |element|
    occurrences[element.size] += 1
  end
  
  occurrences
end


# def word_sizes(input)

# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

