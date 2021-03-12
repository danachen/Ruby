# Prob 8: Palindromic Strings (Part 1)

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

  reversed_string == input
end

p palindrome?('madam') #== true
p palindrome?('Madam') #== false          # (case matters)
p palindrome?("madam i'm adam") #== false # (all characters matter)
p palindrome?('356653') #== true