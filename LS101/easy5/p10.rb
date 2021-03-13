# Prob 10: Bannerizer

# need to have 5 lines
# line 1+5 are | + length of sentence in - + 2 + |
# lines 2+4 are | + empty spaces length of sentence + |
# line 3 is the text

def print_in_box(text)

  text_length = text.size + 2

  line_one_five = puts '+' + '-'* text_length + '+'
  line_two_four = puts '|' + ' '* text_length + '|'
  line_three = puts '| ' + text + ' |'
  line_two_four = puts '|' + ' '* text_length + '|'
  line_one_five = puts '+' + '-'* text_length + '+'


end


# Write a method that will take a short line of text, and print it within a box.

# Example:

puts print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
puts print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
