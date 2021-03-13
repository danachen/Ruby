# Prob 4: All Substrings

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


p substrings('abcde') #== [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# Official method

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end