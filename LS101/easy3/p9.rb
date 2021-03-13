# Prob 9: Palindromic Strings (Part 2)

def palindrome?(input)

  reversed_string = ''

  counter = 0
  index = -1

  loop do 
    reversed_string << input[index]
    index -= 1
    counter += 1
    break if counter == input.length
  end

  reversed_string
end

def real_palindrome?(word)
  word = word.downcase.delete('^a-zA-Z-0-9')
  palindrome?(word) == word
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false