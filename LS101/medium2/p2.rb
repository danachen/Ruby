# Prob 2: Now I Know My ABCs

# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not use 
# both letters from any given block. Each block can only be used once.

# PEDAC
# Processing the problem: 
# Input: a string of chars
# Output: boolean value
# Requirements: need to check the string of chars against a constant block, return boolean
# Identify rules: each input string can only contain 1 chars from the block of 2 chars

# Data structure: the spelling block can be a constant array, iterating over the string input

PAIRS = %w( B:O   X:K   D:Q   C:P   N:A  G:T   R:E   F:S   J:W   H:U  V:I   L:Y   Z:M)

def block_word?(input)

  PAIRS.each do |pair|
    counter = 0
      input.upcase.each_char do |char|
        if pair.include?(char)
          counter += 1
          return false if counter == 2
        else true
        end
      end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# Official solution

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

