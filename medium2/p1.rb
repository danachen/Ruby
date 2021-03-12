# Prob one: Longest Sentence

input = File.read('p1.txt')

sentences = input.split(/\.|\?|\!/)

sentences.map! do |sentence|
  sentence.split.size
end

p sentences.max
  


# str = ['hello how are you', 'im fine thanks']

# str.map! {|sentence| sentence.split.size}

# p str.max