#Solution 1
class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end
  
  def match(possible_anagrams)
    possible_anagrams.select do |w|
      anagram?(w) 
    end
  end

  def anagram?(w)
    sorted_word = word.chars.sort.join
    w.downcase.chars.sort.join == sorted_word && w.downcase != word
  end
end

#Solution 2
# using Array#sort: 2 things to note: 1. the use of #casecmp, 2. passing in a method as a block
class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    @word.casecmp(word).nonzero? && [@word, word].map(&sort_chars).uniq.size == 1
  end

  def sort_chars
    -> (word) { word.downcase.chars.sort }
  end
end

# # using a frequency Hash instead of Array#sort: using Hash to compare the two sets of words
class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    @word.casecmp(word).nonzero? && char_freq(@word) == char_freq(word)
  end

  def char_freq(word)
    chars = word.downcase.chars
    chars.uniq.map { |char| [char, chars.count(char)] }.to_h
  end
end

# using Array#count instead of Array#sort: same principle as using the array, except all? make sure
# each element of hte array satisfies  the conditional passed in array
class Anagram
  def initialize(word)
    @word = word
    @chars = word.downcase.chars
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    chars = word.downcase.chars
    @word.casecmp(word).nonzero? && @word.size == word.size &&
      @chars.uniq.all? { |char| chars.count(char) == @chars.count(char) }
  end
end

detector = Anagram.new('corn')
anagrams = detector.match %w(corn dark Corn rank CORN cron park)
