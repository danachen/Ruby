# Prob 4: Letter Swap

# Given a string of words separated by spaces, write a method that takes 
# this string of words and returns a string in which the first and last letters 
# of every word is swapped.

def swap(str)

  str_arr = str.split(' ')

  str_arr.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end 
  str_arr.join(' ')
end 


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'