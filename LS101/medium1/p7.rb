# Prob 7: Word to Digit

NUMBERS = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']

# def word_to_digit(input)

#   input_arr = input.split
 
#   input_arr.map do |word|
#     if NUMBERS.include?(word)
#       p word = (NUMBERS.index(word)+1).to_s
#     else
#       p word
#     end
#     word
#   end 
#   input_arr.join(' ')
# end


# def word_to_digit(input)
#   new_arr = []

#   input.split.map do |word|
#     word.delete!('^A-Za-z')
#     if NUMBERS.include?(word)
#       new_arr << (NUMBERS.index(word)+1).to_s
#     else
#       new_arr << word
#     end
#   end  
#   new_arr.join(' ')
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') 
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# another student solution

WORDS = %w(zero one two three four five six seven eight nine).freeze

def word_to_digit(str)
  WORDS.each_with_index do |word, index|
    str.gsub!(/#{word}/, index.to_s)
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') 
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'



