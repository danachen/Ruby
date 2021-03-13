# Prob 4: Reverse Sentence

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = words.size
  while i > 0
    reversed_words << words[i-1]
    i -= 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'