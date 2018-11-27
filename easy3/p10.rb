# Prob 10: Palindromic Numbers

def palindrome?(input)

  input = input.to_s
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

def palindromic_number?(num)
  palindrome?(num).to_i == num
end


p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true