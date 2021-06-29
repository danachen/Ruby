class Anagram
  attr_reader :sorted_characters, :word

  def initialize(word)
    @word = word
    @sorted_characters = sort_characters(word)
  end

  def match(list_of_possibilities)
    list_of_possibilities.select { |el| anagram?(el) }
  end

  private

  def anagram?(el)
    sort_characters(el) == sorted_characters && el.downcase != word.downcase
  end

  def sort_characters(word)
    word.downcase.chars.sort
  end
end