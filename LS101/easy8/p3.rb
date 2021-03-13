# Prob 3: Leading Substrings

# Need to find successive substrings, not unlike prob 1
# can just splice, splice(0, string.size)

def substrings_at_start(input)

  new_string = []
  
  input.chars.each_with_index do |_, idx|
    new_string << input.slice(0, idx+1)
  end
  
  new_string
end


p substrings_at_start('abc') #== ['a', 'ab', 'abc']
p substrings_at_start('a') #== ['a']
p substrings_at_start('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']