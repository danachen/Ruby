# Original solution
class Phrase
  attr_reader :word

  def initialize(str)
    @word = str
  end

  def word_count
    transform_word.each_with_object(Hash.new(0)) {|word, hsh| hsh[word] += 1}
  end

  private

  def transform_word
    @word.scan(/[0-9a-z](?:[0-9a-z'\d]*[0-9a-z])?/i).map(&:downcase)
  end
end

# Further exploration
class Phrase
  attr_reader :word

  def initialize(str)
    @word = str
  end

  def word_count
    transform_word.each_with_object(Hash.new(0)) {|word, hsh| hsh[word] += 1}
  end

  private

  def transform_word
    @word.gsub(/\'(\b[\w']+\b)\'/, '\1').scan(/[[\w]\']+/).map(&:downcase)
  end
end

phrase = Phrase.new("Teachers' pet: is! too tired to ki's the frog.")
p phrase.word_count