# Prob 5: Palindromic Substrings

# take a string input
# check to see if any characters are palindromes, whole word or part of word
# output the chars to a new array, all possible ones
# basically need to have every substring of the input listed, and find anything

def substrings_at_start(input)

  new_string = []

  input.chars.each_with_index do |_, idx|
    new_string << input.slice(0, idx+1)
  end
  new_string
end

def substrings(original)
  final_string = []

  original.chars.each_with_index do |_, idx|
    string = []
    string << original.slice(idx, original.size)
    final_string << substrings_at_start(string.join)
  end
  final_string.flatten
end

def palindromes(str)

  new_string = substrings(str)

  new_string.select {|word| word == word.reverse && word.size > 1}

end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]