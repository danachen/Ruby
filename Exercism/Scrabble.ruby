class Scrabble
  attr_reader :word

  DICTIONARY = { 'A': 1, 'E': 1, 'I': 1, 'L': 1, 'N': 1, 'O': 1, 'R': 1, 'S': 1, 'T': 1, 'U': 1,
                 'D': 2, 'G': 2, 
                 'B': 3, 'C': 3, 'M': 3, 'P': 3,
                 'F': 4, 'H': 4, 'V': 4, 'W': 4, 'Y': 4,
                 'K': 5,
                 'J': 8, 'X': 8,
                 'Q': 10, 'Z': 10 }

  def initialize(word)
    @word = only_letters(word || '')
  end

  def score
    word.chars.map { |char| DICTIONARY[char.to_sym] }.sum
  end

  def self.score(word)
    new(word).score
  end

  private

  def only_letters(input)
    input.strip.upcase
  end
end