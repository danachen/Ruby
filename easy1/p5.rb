# Prob 5: Reverse 1

def reverse_sentence(input)
  new_arr = input.split.reverse.join(' ')
end


puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'


